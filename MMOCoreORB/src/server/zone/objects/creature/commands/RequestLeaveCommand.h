/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef REQUESTLEAVECOMMAND_H_
#define REQUESTLEAVECOMMAND_H_


#include "templates/faction/Factions.h"

class RequestLeaveCommand : public QueueCommand {
public:

	RequestLeaveCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature) || !creature->isPlayerCreature() )
					return INVALIDSTATE;

		if (creature->getFaction() != Factions::FACTIONIMPERIAL && creature->getFaction() != Factions::FACTIONREBEL )
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;


		if (creature->getZone() == NULL)
			return SUCCESS;

		if (creature->getZone()->getZoneName() == "dungeon1")
			return SUCCESS;

		PlayerObject* playerGhost = creature->getPlayerObject();

		if ( creature->getFactionStatus() == FactionStatus::COVERT || creature->getFactionStatus() == FactionStatus::OVERT )
			playerGhost->doFieldFactionChange(FactionStatus::ONLEAVE);

		return SUCCESS;
	}

};

#endif //RequestLeaveCommand_H_
