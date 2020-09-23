/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORMUPCOMMAND_H_
#define FORMUPCOMMAND_H_

#include "SquadLeaderCommand.h"

class FormupCommand : public SquadLeaderCommand {
public:

	FormupCommand(const String& name, ZoneProcessServer* server)
		: SquadLeaderCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		ManagedReference<CreatureObject*> player = cast<CreatureObject*>(creature);

		if (player == nullptr)
			return GENERALERROR;

		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		ManagedReference<GroupObject*> group = player->getGroup();

		if (!checkGroupLeader(player, group))
			return GENERALERROR;

		int mindCost = (int) (1350.0f * calculateGroupModifier(group));
		int adjustedMindCost = creature->calculateCostAdjustment(CreatureAttribute::FOCUS, mindCost);

		if (!inflictHAM(player, 0, 0, adjustedMindCost)){
			return GENERALERROR;
		}

			if (!player->checkCooldownRecovery("formup")) {
				player->sendSystemMessage("Your is not ready to form up yet."); //You cannot burst run right now.
				return GENERALERROR;
			}

		if (!doFormUp(player, group))
			return GENERALERROR;

		if (!ghost->getCommandMessageString(STRING_HASHCODE("formup")).isEmpty() && creature->checkCooldownRecovery("command_message")) {
			UnicodeString shout(ghost->getCommandMessageString(STRING_HASHCODE("formup")));
 	 	 	server->getChatManager()->broadcastChatMessage(player, shout, 0, 80, player->getMoodID(), 0, ghost->getLanguageID());
 	 	 	creature->updateCooldownTimer("command_message", 30 * 1000);
		}

		return SUCCESS;
	}

	bool doFormUp(CreatureObject* leader, GroupObject* group) const {
		if (leader == nullptr || group == nullptr)
			return false;
		leader->updateCooldownTimer("formup", 10000);

		for (int i = 0; i < group->getGroupSize(); i++) {

			ManagedReference<CreatureObject*> member = group->getGroupMember(i);

			if (member == nullptr || !member->isPlayerCreature() || member->getZone() != leader->getZone() ||  !member->isInRange(leader, 128.0))
				continue;

			if (!isValidGroupAbilityTarget(leader, member, false))
				continue;

			Locker clocker(member, leader);

			sendCombatSpam(member);

			if (member->isDizzied())
				member->removeStateBuff(CreatureState::DIZZY);

			if (member->isStunned())
				member->removeStateBuff(CreatureState::STUNNED);

			if ( member->isIntimidated())
				member->removeStateBuff(CreatureState::INTIMIDATED);

			checkForTef(leader, member);
		}

		return true;
	}

};

#endif //FORMUPCOMMAND_H_
