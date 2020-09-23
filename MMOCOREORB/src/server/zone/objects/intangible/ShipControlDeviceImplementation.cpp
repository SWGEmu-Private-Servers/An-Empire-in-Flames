/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/tangible/deed/structure/StructureDeed.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/Zone.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/objects/structure/StructureObject.h"
#include "server/zone/managers/structure/StructureManager.h"
#include "server/zone/objects/tangible/deed/structure/StructureDeed.h"
#include "server/zone/packets/scene/AttributeListMessage.h"
#include "server/zone/objects/cell/CellObject.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/packets/player/EnterStructurePlacementModeMessage.h"
#include "templates/manager/TemplateManager.h"
#include "server/zone/objects/player/sessions/PlaceStructureSession.h"
#include "server/zone/objects/intangible/ShipControlDevice.h"
#include "server/zone/objects/player/sui/transferbox/SuiTransferBox.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"
#include "server/zone/objects/player/sui/callbacks/StructurePayMaintenanceSuiCallback.h"
#include "server/zone/objects/player/sui/callbacks/StructureStatusSuiCallback.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/region/CityRegion.h"
#include "server/zone/managers/city/CityManager.h"

void ShipControlDeviceImplementation::generateObject(CreatureObject* player) {

	ZoneServer* zoneServer = getZoneServer();

	Reference<TangibleObject*> controlledObject = this->controlledObject.get();

	Locker clocker(controlledObject, player);
	if (controlledObject->isShipObject())
	{
		controlledObject->initializePosition(player->getPositionX(), player->getPositionZ() + 10, player->getPositionY());
		player->getZone()->transferObject(controlledObject, -1, true);
	}

	if (controlledObject->isShipObject())
	{
		controlledObject->transferObject(player, 5, true);
		//controlledObject->inflictDamage(player, 0, System::random(50), true);
		player->setState(CreatureState::PILOTINGSHIP);
		updateStatus(1);
		PlayerObject* ghost = player->getPlayerObject();

		if (ghost != nullptr)
			ghost->setTeleporting(true);
	}
}

void ShipControlDeviceImplementation::storeObject(CreatureObject* player, bool force) {
	player->clearState(CreatureState::PILOTINGSHIP);

	ManagedReference<TangibleObject*> controlledObject = this->controlledObject.get();

	if (controlledObject == nullptr)
		return;

	Locker clocker(controlledObject, player);

	if (!controlledObject->isInQuadTree())
		return;

	Zone* zone = player->getZone();

	if (zone == nullptr)
		return;

	zone->transferObject(player, -1, false);
	
	controlledObject->destroyObjectFromWorld(true);

	transferObject(controlledObject, 4, true);
	
	updateStatus(0);
}

void ShipControlDeviceImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {
	//ControlDeviceImplementation::fillObjectMenuResponse(menuResponse, player);

	ManagedReference<TangibleObject*> controlledObject = this->controlledObject.get();
	if (controlledObject->isShipControlDevice())
	{
		if (!controlledObject->isInQuadTree()) {
			menuResponse->addRadialMenuItem(60, 3, "Launch Ship"); //Launch
		} else
			menuResponse->addRadialMenuItem(61, 3, "Land Ship"); //Land
	}
}

bool ShipControlDeviceImplementation::canBeTradedTo(CreatureObject* player, CreatureObject* receiver, int numberInTrade) {
	ManagedReference<SceneObject*> datapad = receiver->getSlottedObject("datapad");

	if (datapad == nullptr)
		return false;

	Reference<TangibleObject*> controlledObject = this->controlledObject.get();

	ManagedReference<PlayerManager*> playerManager = player->getZoneServer()->getPlayerManager();

	int shipsInDatapad = numberInTrade;
	int maxStoredShips = playerManager->getBaseStoredShips();

	for (int i = 0; i < datapad->getContainerObjectsSize(); i++) {
		Reference<SceneObject*> obj =  datapad->getContainerObject(i).castTo<SceneObject*>();

		if (obj != nullptr && obj->isShipControlDevice() ){
			shipsInDatapad++;
		}
	}

	if( shipsInDatapad >= maxStoredShips){
		player->sendSystemMessage("That person has too many ships in their datapad");
		receiver->sendSystemMessage("You already have the maximum number of ships that you can own.");
		return false;
	}

	return true;
}

int ShipControlDeviceImplementation::canBeDestroyed(CreatureObject* player) {
	ManagedReference<TangibleObject*> controlledObject = this->controlledObject.get();
	return IntangibleObjectImplementation::canBeDestroyed(player);
}
