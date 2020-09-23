/*
				Copyright Empire in Flames project
*/

#ifndef SHOOTFIRSTCOMMAND_H_
#define SHOOTFIRSTCOMMAND_H_

#include "CombatQueueCommand.h"

class ShootFirstCommand : public CombatQueueCommand {
public:

	ShootFirstCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isInCombat()) {
			if (creature->isPlayerCreature())
				return doCombatAction(creature, target);
		}	 else {
				(cast<CreatureObject*>(creature))->sendSystemMessage("You cannot use Shoot First after combat has started!");
				return INVALIDTARGET;
		}

		return SUCCESS;

	}

};

#endif //SHOOTFIRSTCOMMAND_H_
