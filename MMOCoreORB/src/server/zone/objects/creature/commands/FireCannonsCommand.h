/*
				Copyright Empire in Flames project
*/

#ifndef FIRECANNONSCOMMAND_H_
#define FIRECANNONSCOMMAND_H_

#include "CombatQueueCommand.h"

class FireCannonsCommand : public CombatQueueCommand {
public:

	FireCannonsCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	float getCommandDuration(CreatureObject* object, const UnicodeString& arguments) const {
		return 2.0;
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		ZoneServer* zoneServer = server->getZoneServer();

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		ManagedReference<SceneObject*> object = zoneServer->getObject(target);

		if (object == nullptr)
			return INVALIDTARGET;

		if (!creature->isFacingObject(object))
			return INVALIDTARGET;

		if (creature->isRidingMount())
			{
			ManagedReference<CreatureObject*> mount = creature->getParent().get().castTo<CreatureObject*>();
				if (mount->getPvpStatusBitmask() == CreatureFlag::COMBATVEHICLE)
				{
					Locker crossLocker(mount, creature);
					return doCombatAction(mount, target);
				}
			}
		return INVALIDTARGET;
	}
};

#endif //FIRECANNONSCOMMAND_H_
