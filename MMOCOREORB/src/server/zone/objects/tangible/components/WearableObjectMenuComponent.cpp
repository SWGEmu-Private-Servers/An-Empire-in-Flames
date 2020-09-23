/*
 * WearableObjectMenuComponent.cpp
 *
 *  Created on: 10/30/2011
 *      Author: kyle
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "WearableObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"

void WearableObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {
	if (!sceneObject->isTangibleObject())
		return;

	TangibleObject* tano = cast<TangibleObject*>(sceneObject);
	if (tano == nullptr)
		return;

	if (tano->getConditionDamage() > 0 && tano->canRepair(player)) {
		menuResponse->addRadialMenuItem(70, 3, "@sui:repair"); // Slice
	}

	String text = sceneObject->getObjectTemplate()->getTemplateFileName();
	String text2 = sceneObject->getObjectTemplate()->getAppearanceFilename();

//works
//	if (sceneObject->getObjectTemplate()->getFullTemplateString() == "object/tangible/wearables/robe/robe_s05.iff" || sceneObject->getObjectTemplate()->getFullTemplateString() == "object/tangible/wearables/robe/robe_s05_h1.iff" )
//		menuResponse->addRadialMenuItem(90, 3, text);
//		menuResponse->addRadialMenuItem(90, 3, text);
//		menuResponse->addRadialMenuItem(91, 3, text2);

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

}

int WearableObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (!sceneObject->isASubChildOf(player))
		return 0;

	if (selectedID == 70) {
		if(!sceneObject->isTangibleObject())
			return 0;

		TangibleObject* tano = cast<TangibleObject*>(sceneObject);
		if(tano == nullptr)
			return 0;

		tano->repair(player);

		return 1;
	}

//	if(selectedID == 90) {

//		if(!sceneObject->isTangibleObject())
//			return 0;
//
//		TangibleObject* tano = cast<TangibleObject*>(sceneObject);
//		if(tano == NULL)
//			return 0;
//
//		if (sceneObject->getObjectTemplate()->getTemplateFileName() == "robe_s05"){
//			sceneObject->getObjectTemplate()->setTemplateFileName("robe_s05_h1");
//			return 1;}
//		if (sceneObject->getObjectTemplate()->getTemplateFileName() == "robe_s05_h1"){
//			sceneObject->getObjectTemplate()->setTemplateFileName("robe_s05");
//			return 1;		}
//		if (sceneObject->getObjectTemplate()->getFullTemplateString() == "object/tangible/wearables/robe/robe_s05.iff")
//		{
//			sceneObject->getObjectTemplate()->setFullTemplateString("object/tangible/wearables/robe/robe_s05_h1.iff");
//		}
//		else if (sceneObject->getObjectTemplate()->getFullTemplateString() == "object/tangible/wearables/robe/robe_s05_h1.iff")
//			sceneObject->getObjectTemplate()->setFullTemplateString("object/tangible/wearables/robe/robe_s05.iff");
//		return 1;
//	return 0;
//	}

	return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}
