

#ifndef SKULKCOMMAND_H_
#define SKULKCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class SkulkCommand : public QueueCommand {
public:

	SkulkCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (creature->hasAttackDelay())
			return GENERALERROR;

		if (creature->isInCombat()) {
			cast<CreatureObject*>(creature)->sendSystemMessage("You cannot skulk in combat!");
			return GENERALERROR;
		}
		creature->setPosture(CreaturePosture::SNEAKING);
		if (creature->isDizzied() && System::random(100) < 25)
			creature->queueDizzyFallEvent();

		return SUCCESS;
	}

};

#endif //SKULKCOMMAND_H_
