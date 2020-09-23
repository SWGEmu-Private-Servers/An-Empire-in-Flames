/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SURPRISESHOTCOMMAND_H_
#define SURPRISESHOTCOMMAND_H_

#include "CombatQueueCommand.h"

class SurpriseShotCommand : public CombatQueueCommand {
public:

	SurpriseShotCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!creature->isInCover()){
			return INVALIDTARGET;
		}

		if (!checkStateMask(creature)){
			return INVALIDSTATE;
		}

		if (!checkInvalidLocomotions(creature)){
			return INVALIDLOCOMOTION;
		}

		return doCombatAction(creature, target);
	}

};

#endif //SURPRISESHOTCOMMAND_H_
