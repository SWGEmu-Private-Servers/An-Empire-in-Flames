/*
 * StructureAdjustLotsSuiCallback.h
 *
<<<<<<< HEAD
 *  Created on: Jan 31, 2019
 *      Author: Phoenix
 *  Created for the Empire in Flames project
=======
 *      Author: Phoenix
>>>>>>> a7b0464e77... Initial Commit - Merged House Packup + Additional Lots Code
 */

#ifndef STRUCTUREADJUSTLOTSSUICALLBACK_H_
#define STRUCTUREADJUSTLOTSSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/structure/StructureObject.h"
#include "server/zone/managers/structure/StructureManager.h"


class StructureAdjustLotsSuiCallback : public SuiCallback {
public:
	String arguement;
	StructureAdjustLotsSuiCallback(ZoneServer* serv, String s) : SuiCallback(serv) {
		arguement = s;
	}

	void run(CreatureObject* creature, SuiBox* sui, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		if (!sui->isTransferBox() || cancelPressed || args->size() < 2)
			return;

		int amount = Integer::valueOf(args->get(1).toString());

		if (amount < 0)
			return;

		ManagedReference<SceneObject*> obj = sui->getUsingObject().get();

		if (obj == nullptr || !obj->isStructureObject()) {
			creature->sendSystemMessage("@player_structure:invalid_target"); // "Your original structure target is no longer valid. Aborting..."
			return;
		}

		//Deposit/Withdraw the maintenance
		BuildingObject* structure = cast<BuildingObject*>(obj.get());

		ManagedReference<Zone*> zone = structure->getZone();

        ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (zone == nullptr)
			return;

        Locker _lock(structure, creature);
		if (arguement == "add")
		{
        	ghost->setMaximumLots(ghost->getMaximumLots() - amount);
        	structure->addExtraAssignedLots(amount);
		}
        else if (arguement == "subtract")
		{
			int playerObjects = structure->getCurrentNumberOfPlayerItems();
			int maxPlayerObjects = structure->getMaximumNumberOfPlayerItems();
			int lotSize = structure->getLotSize() + structure->getExtraAssignedLots();
			int adjustedLots = lotSize - amount;
			int adjustedMaxPlayerObjects = adjustedLots * 150;

			if (adjustedMaxPlayerObjects < playerObjects)
			{
				creature->sendSystemMessage("You currently have " + String::valueOf(playerObjects - adjustedMaxPlayerObjects) + " too many items placed to withdrawl lots.");
				return;
			}

			ghost->setMaximumLots(ghost->getMaximumLots() + amount);
        	structure->removeExtraAssignedLots(amount);
		}
	}
};

#endif /* STRUCTUREADJUSTLOTSSUICALLBACK_H_ */ 
