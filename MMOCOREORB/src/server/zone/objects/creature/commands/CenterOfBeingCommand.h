/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef CENTEROFBEINGCOMMAND_H_
#define CENTEROFBEINGCOMMAND_H_

#include "server/zone/objects/creature/buffs/PrivateSkillMultiplierBuff.h"

class CenterOfBeingCommand : public QueueCommand {
public:

	CenterOfBeingCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		PlayerObject* ghost = creature->getPlayerObject();

		if (creature->hasBuff(STRING_HASHCODE("centerofbeing"))) {
			creature->sendSystemMessage("@combat_effects:already_centered");
			return GENERALERROR;
		}

		WeaponObject* weapon = creature->getWeapon();

		int duration = 0;
		int efficacy = 0;
		int toughness = 0;
		String toughnessMod = "";

		if (weapon->isUnarmedWeapon()) {
			duration = creature->getSkillMod("center_of_being_duration_unarmed");
			efficacy = creature->getSkillMod("unarmed_center_of_being_efficacy");
			toughness = creature->getSkillMod("unarmed_toughness");
			toughnessMod = "unarmed_toughness";
		} else if (weapon->isOneHandMeleeWeapon()) {
			duration = creature->getSkillMod("center_of_being_duration_onehandmelee");
			efficacy = creature->getSkillMod("onehandmelee_center_of_being_efficacy");
			toughness = creature->getSkillMod("onehandmelee_toughness");
			toughnessMod = "onehandmelee_toughness";
		} else if (weapon->isTwoHandMeleeWeapon()) {
			duration = creature->getSkillMod("center_of_being_duration_twohandmelee");
			efficacy = creature->getSkillMod("twohandmelee_center_of_being_efficacy");
			toughness = creature->getSkillMod("twohandmelee_toughness");
			toughnessMod = "twohandmelee_toughness";
		} else if (weapon->isPolearmWeaponObject()) {
			duration = creature->getSkillMod("center_of_being_duration_polearm");
			efficacy = creature->getSkillMod("polearm_center_of_being_efficacy");
			toughness = creature->getSkillMod("polearm_toughness");
			toughnessMod = "polearm_toughness";
		} else
			return GENERALERROR;

		if (duration == 0 || efficacy == 0)
			return GENERALERROR;

		Buff* centered = new Buff(creature, STRING_HASHCODE("centerofbeing"), duration, BuffType::SKILL,STRING_HASHCODE("private_cob_multiplier"));

		Locker locker(centered);


		centered->setSkillModifier("private_center_of_being", efficacy);

		// Increase Toughness By Efficay / 3
		toughness += efficacy/3;
		centered->setSkillModifier(toughnessMod, toughness);


		StringIdChatParameter startMsg("combat_effects", "center_start");
		StringIdChatParameter endMsg("combat_effects", "center_stop");
		centered->setStartMessage(startMsg);
		centered->setEndMessage(endMsg);

		centered->setStartFlyText("combat_effects", "center_start_fly", 0, 255, 0);
		centered->setEndFlyText("combat_effects", "center_stop_fly", 255, 0, 0);

		creature->addBuff(centered);

		Reference<PrivateSkillMultiplierBuff*> multBuff = new PrivateSkillMultiplierBuff(creature, STRING_HASHCODE("private_cob_multiplier"), duration, BuffType::SKILL);

		Locker blocker(multBuff, creature);

		multBuff->setSkillModifier("private_damage_divisor", 5);
		multBuff->setSkillModifier("private_damage_multiplier", 4);

		creature->addBuff(multBuff);

		return SUCCESS;
	}

};

#endif //CENTEROFBEINGCOMMAND_H_
