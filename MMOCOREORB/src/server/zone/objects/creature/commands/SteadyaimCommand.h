/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef STEADYAIMCOMMAND_H_
#define STEADYAIMCOMMAND_H_

#include "SquadLeaderCommand.h"

class SteadyaimCommand : public SquadLeaderCommand {
public:

	SteadyaimCommand(const String& name, ZoneProcessServer* server)
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

		if (!player->checkCooldownRecovery("steadyaim")) {
			player->sendSystemMessage("Your group is still recovering their focus and must wait to steady their aim."); //You cannot burst run right now.
			return false;
		}

		ManagedReference<GroupObject*> group = player->getGroup();

		if (!checkGroupLeader(player, group))
			return GENERALERROR;

		float skillMod = (float) creature->getSkillMod("steadyaim");
		int mindCost = (int) (200.0f * (1.0f - (skillMod / 100.0f))) * calculateGroupModifier(group);
		int adjustedMindCost = creature->calculateCostAdjustment(CreatureAttribute::FOCUS, mindCost);

		if (!inflictHAM(player, 0, 0, adjustedMindCost))
			return GENERALERROR;

//		shoutCommand(player, group);

		int amount = 25 + skillMod;

		if (!doSteadyAim(player, group, amount))
			return GENERALERROR;

		if (!ghost->getCommandMessageString(STRING_HASHCODE("steadyaim")).isEmpty() && creature->checkCooldownRecovery("command_message")) {
			UnicodeString shout(ghost->getCommandMessageString(STRING_HASHCODE("steadyaim")));
 	 	 	server->getChatManager()->broadcastChatMessage(player, shout, 0, 80, player->getMoodID(), 0, ghost->getLanguageID());
 	 	 	creature->updateCooldownTimer("command_message", 30 * 1000);
		}

		return SUCCESS;
	}

	bool doSteadyAim(CreatureObject* leader, GroupObject* group, int amount) const {
		if (leader == nullptr || group == nullptr)
			return false;

		for (int i = 0; i < group->getGroupSize(); i++) {
			ManagedReference<CreatureObject*> member = group->getGroupMember(i);

			if (member == nullptr || !member->isPlayerCreature() || member->getZone() != leader->getZone() || !member->isInRange(leader, 128.0) )
				continue;

			if (!isValidGroupAbilityTarget(leader, member, false))
				continue;

			Locker clocker(member, leader);

			sendCombatSpam(member);

			ManagedReference<WeaponObject*> weapon = member->getWeapon();

			// Should work on Melee Weapons too.
			// if (!weapon->isRangedWeapon())
			// 	continue;

			int duration = 300;

			ManagedReference<Buff*> buff = new Buff(member, actionCRC, duration, BuffType::SKILL);

			Locker locker(buff);

			buff->setSkillModifier("private_aim", amount);
			buff->setStartFlyText("combat_effects", "go_steady", 0, 0xFF, 0); // there is no corresponding no_steady fly text

			member->addBuff(buff);
			//			memberPlayer->showFlyText("combat_effects", "go_steadied", 0, 0xFF, 0); // there is no corresponding no_steady fly text

			checkForTef(leader, member);
		}
		leader->updateCooldownTimer("steadyaim", 10000);
		return true;
	}

};

#endif //STEADYAIMCOMMAND_H_
