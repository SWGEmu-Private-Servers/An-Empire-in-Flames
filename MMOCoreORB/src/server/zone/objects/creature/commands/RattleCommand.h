/*
				Copyright Empire in Flames project
*/

#ifndef RATTLECOMMAND_H_
#define RATTLECOMMAND_H_

#include "CombatQueueCommand.h"

class RattleCommand : public CombatQueueCommand {
public:

	RattleCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	float getCommandDuration(CreatureObject* object, const UnicodeString& arguments) const {
		return 1.0;
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		ZoneServer* zoneServer = server->getZoneServer();

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (target == 0)
			return GENERALERROR;

		ManagedReference<SceneObject*> object = zoneServer->getObject(target);
		
		if (!object->isCreatureObject())
			return INVALIDTARGET;

		CreatureObject* pet = cast<CreatureObject*>( object.get());

		ManagedReference<CreatureObject*> player = static_cast<CreatureObject*>(creature);

		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		if (ghost->getAdminLevel() > 0)
			{
			Locker locker(pet);
			server->getChatManager()->broadcastChatMessage(pet, arguments, 0, 0, player->getMoodID(), 0, ghost->getLanguageID());
			return SUCCESS;
			}

		else if (pet->isPet() && (pet->isNonPlayerCreatureObject() || pet->isDroidObject()) && pet->getCreatureLinkID() == creature->getObjectID())
			{
			Locker locker(pet);
			server->getChatManager()->broadcastChatMessage(pet, arguments, 0, 0, player->getMoodID(), 0, ghost->getLanguageID());
			return SUCCESS;
			}
		else
			return INVALIDTARGET;
	}
};

#endif //RattleCommand_H_
