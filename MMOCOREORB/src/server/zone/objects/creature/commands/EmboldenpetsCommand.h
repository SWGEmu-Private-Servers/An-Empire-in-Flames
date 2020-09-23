/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef EMBOLDENPETSCOMMAND_H_
#define EMBOLDENPETSCOMMAND_H_

#include "server/zone/objects/intangible/PetControlDevice.h"
#include "server/zone/managers/creature/PetManager.h"
#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/player/PlayerObject.h"

class EmboldenpetsCommand : public QueueCommand {
public:

	EmboldenpetsCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* player, const uint64& target, const UnicodeString& arguments) const {

		int cooldownMilli = 60000; // 1 min
		int durationSec =  60; // 1 min
		int mindCost = player->calculateCostAdjustment(CreatureAttribute::FOCUS, 1500 );
		unsigned int buffCRC = STRING_HASHCODE("enhancePet");

		if (!checkStateMask(player))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(player))
			return INVALIDLOCOMOTION;

		if (player->isDead() || player->isIncapacitated())
			return INVALIDSTATE;

		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		if( ghost == nullptr )
			return GENERALERROR;

		// Check player mind
		if (player->getHAM(CreatureAttribute::MIND) <= mindCost) {
			player->sendSystemMessage("@pet/pet_menu:sys_fail_embolden"); // "You do not have enough mental focus to embolden."
			return GENERALERROR;
		}

		// Loop over all active pets
		bool petEmboldened = false;
		for (int i = 0; i < ghost->getActivePetsSize(); ++i) {

			ManagedReference<AiAgent*> pet = ghost->getActivePet(i);
			if(pet == nullptr)
				continue;

			ManagedReference<PetControlDevice*> controlDevice = pet->getControlDevice().get().castTo<PetControlDevice*>();
			if( controlDevice == nullptr )
				continue;

			// Creatures only
			if( controlDevice->getPetType() == PetManager::CREATUREPET ) {

				Locker plocker(pet, player);

				// Check states
				if( pet->isIncapacitated() || pet->isDead() )
					continue;

				// Check range
				if( !checkDistance(player, pet, 50.0f) )
					continue;

				// Check if pet already has buff
				if ( pet->hasBuff(buffCRC) ){
					pet->showFlyText("combat_effects","pet_embolden_no", 0, 153, 0); // "! Already Emboldened !"
					continue;
				}

				// Check cooldown
				if( pet->getCooldownTimerMap() == nullptr || !pet->getCooldownTimerMap()->isPast("enhancePetsCooldown") )
					continue;

				// Build 15% Health, Action, Mind buff
				ManagedReference<Buff*> buff = new Buff(pet, buffCRC, durationSec, BuffType::OTHER);

				Locker locker(buff);

				buff->setSkillModifier("pet_defensive", 50.0f);
				buff->setSkillModifier("private_attack_accuracy", 75);

				pet->addBuff(buff);
				pet->getCooldownTimerMap()->updateToCurrentAndAddMili("enhancePetsCooldown", cooldownMilli);
				pet->showFlyText("combat_effects","pet_embolden", 0, 153, 0); // "! Embolden !"
				petEmboldened = true;

			} // end if creature
		} // end active pets loop

		// At least one pet was emboldened
		if( petEmboldened ){
			player->inflictDamage(player, CreatureAttribute::MIND, mindCost, false);
			player->sendSystemMessage("@pet/pet_menu:sys_embolden"); // "Your pets fight with renewed vigor"
		}

		return SUCCESS;
	}

};

#endif //EMBOLDENPETSCOMMAND_H_
