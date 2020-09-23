/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef VOLLEYFIRECOMMAND_H_
#define VOLLEYFIRECOMMAND_H_

#include "SquadLeaderCommand.h"
#include "server/zone/managers/skill/SkillModManager.h"
#include "server/zone/objects/creature/buffs/PrivateSkillMultiplierBuff.h"

class VolleyFireCommand : public SquadLeaderCommand {
public:

	VolleyFireCommand(const String& name, ZoneProcessServer* server)
		: SquadLeaderCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		ManagedReference<CreatureObject*> player = creature;
		ManagedReference<GroupObject*> group = player->getGroup();

		if (!checkGroupLeader(player, group))
			return GENERALERROR;

		float skillMod = (float) creature->getSkillMod("volley");

		int mindCost = (int) (1500.0f * (1.0f - (skillMod / 100.0f))) * calculateGroupModifier(group);
		int adjustedMindCost = creature->calculateCostAdjustment(CreatureAttribute::FOCUS, mindCost);


		uint64 targetID = target;

		// Changing the attempt to a simple roll if Skill Mod + 60 > roll == Success

		//if (attemptVolleyFire(player, target, skillMod))
		if ( attemptVolleyFire(player,target, skillMod) ){
			if (!inflictHAM(player, 0, 0, adjustedMindCost))
				return GENERALERROR;
			if (!doVolleyFire(player, group, &targetID, skillMod))
				return GENERALERROR;
		}
		return SUCCESS;
	}

	bool attemptVolleyFire(CreatureObject* player,  const uint64& target, int skillMod) const {
		if (player == nullptr)
			return false;

		if (!player->checkCooldownRecovery("volleyfire")) {
			player->sendSystemMessage("Your group is still recovering their focus and must wait to volley their fire."); //You cannot burst run right now.
			return false;
		}

		bool volleyFireSuccess = System::random(100) < skillMod + 75;
		if ( volleyFireSuccess )
		{
			int ret = doCombatAction(player, target);
			if ( ret == SUCCESS ) {
				player->sendSystemMessage("You have focused your group's fire into a volley!");
			} else{
				player->sendSystemMessage("You have /#800000/failed/ your group's fire into a volley!");
			}
			return ret == SUCCESS;
		} else {
				return true;
		}

		//if (!skillCRC.isEmpty())
			//player->addSkillMod(SkillModManager::ABILITYBONUS, skillCRC, (int) skillMod * -2, false);
	}

	bool doVolleyFire(CreatureObject* leader, GroupObject* group, uint64* target, int skillMod) const {
		if (leader == nullptr || group == nullptr){
			return false;
		}

		int duration = 5 + (skillMod/5);
		leader->updateCooldownTimer("volleyfire", (duration * 1000)+20000);
		// Should not increase the SL's damage. That would be OP.
		for (int i = 1; i < group->getGroupSize(); i++) {
			ManagedReference<CreatureObject*> member = group->getGroupMember(i);


			if (!member->isPlayerCreature() || !member->isInRange(leader, 128.0))
				continue;

			if (!isValidGroupAbilityTarget(leader, member, false))
				continue;

			if (!member->isInCombat())
				continue;

			Locker clocker(member, leader);

			if ( member != leader)
				member->sendSystemMessage("Your Squadleader directs a volley of fire! Your damage has been increased.");
			else
					member->sendSystemMessage("You direct a volley of fire! You've increased the damage of your group.");

			sendCombatSpam(member);

			Reference<PrivateSkillMultiplierBuff*> multBuff = new PrivateSkillMultiplierBuff(member, STRING_HASHCODE("private_volley_multiplier"), duration, BuffType::SKILL);

			Locker blocker(multBuff, member);

			multBuff->setSkillModifier("private_damage_divisor", 4);
			multBuff->setSkillModifier("private_damage_multiplier", 5);

			member->addBuff(multBuff);

			checkForTef(leader, member);
		}
		return true;
	}

};

#endif //VOLLEYFIRECOMMAND_H_
