/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef DISMOUNTCOMMAND_H_
#define DISMOUNTCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/intangible/ControlDevice.h"
#include "templates/creature/SharedCreatureObjectTemplate.h"
#include "server/zone/managers/objectcontroller/ObjectController.h"

class DismountCommand : public QueueCommand {
	Vector<uint32> restrictedBuffCRCs;
	uint32 gallopCRC;

public:

	DismountCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

		gallopCRC = STRING_HASHCODE("gallop");

		restrictedBuffCRCs.add(gallopCRC); // Remove the old buff off of any players on dismount
		restrictedBuffCRCs.add(STRING_HASHCODE("burstrun"));
		restrictedBuffCRCs.add(STRING_HASHCODE("retreat"));
		restrictedBuffCRCs.add(BuffCRC::JEDI_FORCE_RUN_1);
		restrictedBuffCRCs.add(BuffCRC::JEDI_FORCE_RUN_2);
		restrictedBuffCRCs.add(BuffCRC::JEDI_FORCE_RUN_3);

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		ManagedReference<SceneObject*> mount = creature->getParent().get();

		if (mount == nullptr || !mount->isCreatureObject()) {
			creature->clearState(CreatureState::RIDINGMOUNT);
			return GENERALERROR;
		}

		if (!creature->checkCooldownRecovery("mount_dismount")) {
			return GENERALERROR;
		}

		CreatureObject* vehicle = cast<CreatureObject*>(mount.get());

		Locker clocker(vehicle, creature);

		vehicle->clearState(CreatureState::MOUNTEDCREATURE);

		/*if (!vehicle->removeObject(creature, true))
			vehicle->error("could not remove creature from mount creature");*/

		Zone* zone = vehicle->getZone();

		if (vehicle != creature->getParent().get())
			return GENERALERROR;

		if (zone == nullptr)
			return GENERALERROR;

		ManagedReference<PlanetManager*> planetManager = zone->getPlanetManager();

		if (planetManager == nullptr)
			return GENERALERROR;

		TerrainManager* terrainManager = planetManager->getTerrainManager();

		if (terrainManager == nullptr)
			return GENERALERROR;

		ZoneServer* zoneServer = server->getZoneServer();
		ManagedReference<ObjectController*> objectController = zoneServer->getObjectController();	

		for (int i = 1; i < 8; ++i) {
			String text = "rider";
			text += String::valueOf(i);
//			info("checking for slot " + text, true);
			CreatureObject* seat = vehicle->getSlottedObject(text).castTo<CreatureObject*>();
			if (seat != nullptr) {
				Locker slocker(seat);
				CreatureObject* rider = seat->getSlottedObject("rider").castTo<CreatureObject*>();
				if (rider != nullptr) {
					Locker rlocker(rider, seat);
					seat->setPosition(vehicle->getPositionX(), vehicle->getPositionZ(), vehicle->getPositionY());
					rider->setPosition(vehicle->getPositionX(), vehicle->getPositionZ(), vehicle->getPositionY());
					objectController->activateCommand(rider, STRING_HASHCODE("dismount"), 0, 0, "");
				} else {
					seat->destroyObjectFromWorld(true);
				}
			}
		}

		zone->transferObject(creature, -1, false);

		IntersectionResults intersections;
		CollisionManager::getWorldFloorCollisions(creature->getPositionX(), creature->getPositionY(), zone, &intersections, (CloseObjectsVector*) creature->getCloseObjects());
		float z = planetManager->findClosestWorldFloor(creature->getPositionX(), creature->getPositionY(), creature->getPositionZ(), creature->getSwimHeight(), &intersections, (CloseObjectsVector*) creature->getCloseObjects());

		creature->teleport(creature->getPositionX(), z, creature->getPositionY(), 0);

		clocker.release(); // Buff needs to be locked below

		//reapply speed buffs if they exist
		for (int i=0; i<restrictedBuffCRCs.size(); i++) {

			uint32 buffCRC = restrictedBuffCRCs.get(i);

			if (creature->hasBuff(buffCRC)) {
				ManagedReference<Buff*> buff = creature->getBuff(buffCRC);
				if(buff != nullptr) {
					Locker lock(buff, creature);
					buff->applyAllModifiers();
				}
			}
		}

		Locker storeLocker(vehicle, creature); // Yet another locker for jetpack storage below

		creature->clearState(CreatureState::RIDINGMOUNT);

		SpeedMultiplierModChanges* changeBuffer = creature->getSpeedMultiplierModChanges();
		int bufferSize = changeBuffer->size();

		if (bufferSize > 5) {
			changeBuffer->remove(0);
		}

		changeBuffer->add(SpeedModChange(creature->getSpeedMultiplierMod()));

		ManagedReference<PlayerManager*> playerManager = server->getPlayerManager();

		playerManager->updateSwimmingState(creature, z);

		ManagedReference<ControlDevice*> device = vehicle->getControlDevice().get();

		if (device != nullptr && vehicle->getServerObjectCRC() == 0x32F87A54) { // Auto-store jetpack on dismount.
			device->storeObject(creature, true);
			creature->sendSystemMessage("@pet/pet_menu:jetpack_dismount"); // "You have been dismounted from the jetpack, and it has been stored."
		}


		if (device != nullptr && (vehicle->getServerObjectCRC() == 0xC3B01BAA || vehicle->getServerObjectCRC() == 0xFD3544BF || vehicle->getServerObjectCRC() == 0x89066146)) { // Auto-store airspeeder on dismount.
			device->storeObject(creature, true);
			creature->sendSystemMessage("Your airspeeder has been stored. To call it again, you must visit a vehicle garage.");
		}

		creature->updateToDatabase();

		SharedObjectTemplate* templateData = creature->getObjectTemplate();
		SharedCreatureObjectTemplate* playerTemplate = dynamic_cast<SharedCreatureObjectTemplate*> (templateData);

		if (playerTemplate != nullptr) {
			Vector<FloatParam> speedTempl = playerTemplate->getSpeed();
			creature->setRunSpeed(speedTempl.get(0));
			creature->updateSpeedAndAccelerationMods(); // Reset Force Sensitive control mods to default.
		}

		creature->updateCooldownTimer("mount_dismount", 2000);

		creature->removeMountedCombatSlow(false); // these are already removed off the player - Just remove it off the mount

		if (vehicle->hasBuff(gallopCRC)) {
			ManagedReference<Buff*> buff = vehicle->getBuff(gallopCRC);
			if (buff != nullptr) {
				Core::getTaskManager()->executeTask([=] () {
					Locker lock(vehicle);
					Locker buffLocker(buff, vehicle);
					buff->removeAllModifiers();
				}, "RemoveGallopModsLambda");
			}
		}


		ManagedReference<SceneObject*> parentObject = vehicle->getParent().get();
		CreatureObject* parent = cast<CreatureObject*>(parentObject.get());
		if (parent != nullptr && parent->isCreatureObject()) {
			Locker lock(vehicle);
			Locker plocker(creature);
			creature->removeBuff(String("passenger").hashCode());
			vehicle->destroyObjectFromWorld(true);
		}

		creature->notifyObservers(ObserverEventType::DISMOUNTED, creature);

		return SUCCESS;
	}

};

#endif //DISMOUNTCOMMAND_H_
