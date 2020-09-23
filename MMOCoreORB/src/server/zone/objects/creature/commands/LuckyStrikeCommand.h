/*
				Copyright Empire in Flames project
*/

#ifndef LUCKYSTRIKECOMMAND_H_
#define LUCKYSTRIKECOMMAND_H_

#include "CombatQueueCommand.h"

class LuckyStrikeCommand : public CombatQueueCommand {
public:

	LuckyStrikeCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		return doCombatAction(creature, target);
	}

};

#endif //LUCKYSTRIKECOMMAND_H_
