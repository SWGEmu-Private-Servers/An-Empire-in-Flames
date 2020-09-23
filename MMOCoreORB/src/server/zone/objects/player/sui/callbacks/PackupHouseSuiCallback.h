/*
 * PackupHouseCodeSuiCallback.h
 *
 *      Author: Phoenix
 */

#ifndef PACKUPHOUSESUICALLBACK_H_
#define PACKUPHOUSESUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/structure/StructureObject.h"
#include "server/zone/managers/structure/StructureManager.h"


class PackupHouseSuiCallback : public SuiCallback {
    uint32 Code;
    StructureObject* structure;
public:
	PackupHouseSuiCallback(ZoneServer* serv, int packupCode, StructureObject* structureObj) : SuiCallback(serv) {
        Code = packupCode;
        structure = structureObj;
	}

	void run(CreatureObject* player, SuiBox* sui, uint32 eventIndex, Vector<UnicodeString>* args) {

        Locker lock(player, structure);

        StructureManager* structureManager = StructureManager::instance();

		bool cancelPressed = (eventIndex == 1);

		if (cancelPressed) {
			return;
		}

		uint32 inputtedCode = Integer::valueOf(args->get(0).toString());

		if (inputtedCode != Code) {
			player->sendSystemMessage("Incorrect Code Entered.");
			return;
		}
        else
        {
            structureManager->PackUpHouse(player, structure);
        }
	}
};

#endif /* PACKUPHOUSESUICALLBACK_H_ */