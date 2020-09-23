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
#include "server/zone/objects/intangible/HouseControlDevice.h"
#include "server/zone/objects/player/sui/transferbox/SuiTransferBox.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"
#include "server/zone/objects/player/sui/callbacks/StructurePayMaintenanceSuiCallback.h"
#include "server/zone/objects/player/sui/callbacks/StructureStatusSuiCallback.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/region/CityRegion.h"
#include "server/zone/managers/city/CityManager.h"

void HouseControlDeviceImplementation::unpackHouse(CreatureObject* player){
	ZoneServer* zoneServer = getZoneServer();
	SceneObject* controlDevice = this->asSceneObject();
	Reference<TangibleObject*> controlledObject = this->controlledObject.get();

	if (controlledObject->isStructureObject())
	{
		Reference<BuildingObject*> build = controlledObject.castTo<BuildingObject*>();

		player->sendSystemMessage("Unpacking house...");

		ManagedReference<StructureDeed*> deed = zoneServer->getObject(build->getDeedObjectID()).castTo<StructureDeed*>();

		if (deed == nullptr) {
			player->sendSystemMessage("Error unpacking house! Please report error details to the development team! Structure ID: " + String::valueOf(build->getObjectID()) + ", Deed ID: " + String::valueOf(build->getDeedObjectID()));
			return;
		}
			

		ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");

		int maint = build->getSurplusMaintenance();

		int extraLots = build->getExtraAssignedLots();

		String buildingName = controlDevice->getDisplayedName();
		if (buildingName == "")
			buildingName = "Unpacked house";

		deed->setCustomObjectName(buildingName, true);			
		deed->setSurplusMaintenance(maint);
		deed->setControlDeviceID(controlDevice->getObjectID());
		deed->setAdditionalLots(extraLots);

		for (int i=0; i < getChildrenSize(); ++i)
		{
	        deed->setChildren(children.elementAt(i).getKey(), children.elementAt(i).getValue());
		}

		inventory->transferObject(deed, -1, true);

		inventory->broadcastObject(deed, true);

		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		ghost->removePackedUpStructure(this->getObjectID());

		player->executeObjectControllerAction(STRING_HASHCODE("placestructuremode"), deed->getObjectID(), "");

		Locker dlocker(deed);
		deed->destroyObjectFromWorld(false);
	}

}

void HouseControlDeviceImplementation::payMaintenance(CreatureObject* player){
	Reference<TangibleObject*> controlledObject = this->controlledObject.get();
	Reference<BuildingObject*> build = controlledObject.castTo<BuildingObject*>();
	Reference<SceneObject*> controlDevice = this->asSceneObject();
	StructureManager::instance()->promptPayMaintenance(build, player, controlDevice); 
}

void HouseControlDeviceImplementation::checkStatus(CreatureObject* player){
	Reference<SceneObject*> controlDevice = this->asSceneObject();
	StructureManager::instance()->reportStructureStatus(player, controlDevice);
}

void HouseControlDeviceImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {

	ManagedReference<TangibleObject*> controlledObject = this->controlledObject.get();
	if (controlledObject->isStructureObject())
	{
			menuResponse->addRadialMenuItem(63, 3, "Unpack House"); //Unpack
			menuResponse->addRadialMenuItem(64, 3, "Pay Maintenance"); //Pay Maint
			menuResponse->addRadialMenuItem(65, 3, "Check Status"); //Check Status
	}
}

int HouseControlDeviceImplementation::canBeDestroyed(CreatureObject* player) {
	ManagedReference<TangibleObject*> controlledObject = this->controlledObject.get();
	if (controlledObject->isStructureObject()) 
	{
			return 1;
	}
	return IntangibleObjectImplementation::canBeDestroyed(player);
}
