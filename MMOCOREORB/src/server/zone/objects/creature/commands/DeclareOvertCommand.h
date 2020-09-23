/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef DECLAREOVERTCOMMAND_H_
#define DECLAREOVERTCOMMAND_H_

class DeclareOvertCommand : public QueueCommand {
public:

	DeclareOvertCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature) || !creature->isPlayerCreature() )
					return INVALIDSTATE;

		if (creature->getFaction() != Factions::FACTIONIMPERIAL && creature->getFaction() != Factions::FACTIONREBEL )
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		PlayerObject* playerGhost = creature->getPlayerObject();

		if ( creature->getFactionStatus() == FactionStatus::ONLEAVE ){
			playerGhost->doFieldFactionChange(FactionStatus::COVERT);
		} else if ( creature->getFactionStatus() == FactionStatus::COVERT ) {
			playerGhost->doFieldFactionChange(FactionStatus::OVERT);
		} else if ( creature->getFactionStatus() == FactionStatus::OVERT ) {
			playerGhost->doFieldFactionChange(FactionStatus::COVERT);
		}


		return SUCCESS;
	}

};

#endif //DECLAREOVERTCOMMAND_H_
