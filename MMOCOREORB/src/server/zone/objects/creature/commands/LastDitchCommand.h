/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef LASTDITCHCOMMAND_H_
#define LASTDITCHCOMMAND_H_

#include "CombatQueueCommand.h"
#include "server/zone/objects/scene/SceneObject.h"

class LastDitchCommand : public CombatQueueCommand {
public:

	LastDitchCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		bool validState = true;

		if (!checkStateMask(creature)){
			validState = false;
			return INVALIDSTATE;
		}


		if (!checkInvalidLocomotions(creature))
		{
			validState = false;
			return INVALIDLOCOMOTION;
		}

		StringBuffer logEntry;

		if( creature->getHAM(CreatureAttribute::HEALTH) > 1500 ){
			ManagedReference<CreatureObject*> player = creature;
			player->sendSystemMessage("You are too healthy to attempt such a risky special attack.");
			validState = false;
			return INVALIDTARGET;
		}

		if (validState ){
			creature->inflictDamage(creature, CreatureAttribute::ACTION, creature->getHAM(CreatureAttribute::ACTION)-1, true);
			creature->inflictDamage(creature, CreatureAttribute::MIND, creature->getHAM(CreatureAttribute::MIND)-1, true);
			creature->inflictDamage(creature, CreatureAttribute::HEALTH, creature->getHAM(CreatureAttribute::HEALTH)-1, true);
		}

		return doCombatAction(creature, target);
	}

};

#endif //LASTDITCHCOMMAND_H_
