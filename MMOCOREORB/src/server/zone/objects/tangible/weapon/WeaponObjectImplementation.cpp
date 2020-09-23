/*
 * WeaponObjectImplementation.cpp
 *
 *  Created on: 30/07/2009
 *      Author: victor
 */

#include "server/zone/objects/tangible/weapon/WeaponObject.h"
#include "server/zone/packets/tangible/WeaponObjectMessage3.h"
#include "server/zone/packets/tangible/WeaponObjectMessage6.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/packets/scene/AttributeListMessage.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "templates/tangible/SharedWeaponObjectTemplate.h"
#include "templates/manager/TemplateManager.h"
#include "server/zone/objects/manufactureschematic/craftingvalues/CraftingValues.h"
#include "server/zone/objects/tangible/powerup/PowerupObject.h"
#include "server/zone/objects/tangible/component/lightsaber/LightsaberCrystalComponent.h"
#include "server/zone/packets/object/WeaponRanges.h"
#include "server/zone/ZoneProcessServer.h"


void WeaponObjectImplementation::initializeTransientMembers() {
	TangibleObjectImplementation::initializeTransientMembers();

	weaponTemplate = dynamic_cast<SharedWeaponObjectTemplate*>(TemplateManager::instance()->getTemplate(serverObjectCRC));

	setLoggingName("WeaponObject");

	if(damageSlice > 1.5 || damageSlice < 1) {
		damageSlice = 1;
	}

	if(speedSlice > 1.0 || speedSlice < .5) {
		speedSlice = 1;
	}
}

void WeaponObjectImplementation::notifyLoadFromDatabase() {
	if (forceCost != 0) {
		saberForceCost = forceCost;
		forceCost = 0;
	}

	TangibleObjectImplementation::notifyLoadFromDatabase();
}

void WeaponObjectImplementation::loadTemplateData(SharedObjectTemplate* templateData) {
	TangibleObjectImplementation::loadTemplateData(templateData);

	weaponTemplate = dynamic_cast<SharedWeaponObjectTemplate*>(templateData);

	certified = false;

	attackType = weaponTemplate->getAttackType();
	weaponEffect =  weaponTemplate->getWeaponEffect();
	weaponEffectIndex = weaponTemplate->getWeaponEffectIndex();

	damageType = weaponTemplate->getDamageType();

	armorPiercing = weaponTemplate->getArmorPiercing();

	healthAttackCost = weaponTemplate->getHealthAttackCost();
	actionAttackCost = weaponTemplate->getActionAttackCost();
	mindAttackCost = weaponTemplate->getMindAttackCost();
	saberForceCost = weaponTemplate->getForceCost();

	pointBlankAccuracy = weaponTemplate->getPointBlankAccuracy();
	pointBlankRange = weaponTemplate->getPointBlankRange();

	idealRange = weaponTemplate->getIdealRange();
	idealAccuracy = weaponTemplate->getIdealAccuracy();

	int templateMaxRange = weaponTemplate->getMaxRange();

	if (templateMaxRange > 5 )
		maxRange = templateMaxRange;

	maxRangeAccuracy = weaponTemplate->getMaxRangeAccuracy();

	minDamage = weaponTemplate->getMinDamage();
	maxDamage = weaponTemplate->getMaxDamage();

	woundsRatio = weaponTemplate->getWoundsRatio();

	damageRadius = weaponTemplate->getArea();

	float templateAttackSpeed = weaponTemplate->getAttackSpeed();

	if (templateAttackSpeed > 1)
		attackSpeed = templateAttackSpeed;

	if (!isJediWeapon()) {
		setSliceable(true);
	} else if (isJediWeapon()) {
		setSliceable(false);
	}
}

void WeaponObjectImplementation::sendContainerTo(CreatureObject* player) {
	if (isJediWeapon()) {

		ManagedReference<SceneObject*> saberInv = getSlottedObject("saber_inv");

		if (saberInv != nullptr) {
			saberInv->sendDestroyTo(player);
			//saberInv->closeContainerTo(player, true);

			saberInv->sendWithoutContainerObjectsTo(player);
			saberInv->openContainerTo(player);
		}

	}
}

void WeaponObjectImplementation::createChildObjects() {
	// Create any child objects in a weapon.
	ZoneServer* zoneServer = server->getZoneServer();

	for (int i = 0; i < templateObject->getChildObjectsSize(); ++i) {
		const ChildObject* child = templateObject->getChildObject(i);

		if (child == nullptr)
			continue;

		ManagedReference<SceneObject*> obj = zoneServer->createObject(
				child->getTemplateFile().hashCode(), getPersistenceLevel());

		if (obj == nullptr)
			continue;

		ContainerPermissions* permissions = obj->getContainerPermissionsForUpdate();
		permissions->setOwner(getObjectID());
		permissions->setInheritPermissionsFromParent(true);
		permissions->setDefaultDenyPermission(ContainerPermissions::MOVECONTAINER);
		permissions->setDenyPermission("owner", ContainerPermissions::MOVECONTAINER);

		if (!transferObject(obj, child->getContainmentType())) {
			obj->destroyObjectFromDatabase(true);
			continue;
		}

		childObjects.put(obj);

		obj->initializeChildObject(_this.getReferenceUnsafeStaticCast());
	}

}

void WeaponObjectImplementation::sendBaselinesTo(SceneObject* player) {
	debug("sending weapon object baselines");

	BaseMessage* weao3 = new WeaponObjectMessage3(_this.getReferenceUnsafeStaticCast());
	player->sendMessage(weao3);

	BaseMessage* weao6 = new WeaponObjectMessage6(_this.getReferenceUnsafeStaticCast());
	player->sendMessage(weao6);

	if (player->isCreatureObject()) {
		BaseMessage* ranges = new WeaponRanges(cast<CreatureObject*>(player), _this.getReferenceUnsafeStaticCast());
		player->sendMessage(ranges);
	}
}

String WeaponObjectImplementation::getWeaponType() const {
	int weaponObjectType = getGameObjectType();

	String weaponType;

	switch (weaponObjectType) {
	case SceneObjectType::ONEHANDMELEEWEAPON:
		weaponType = "onehandmelee";
		break;
	case SceneObjectType::TWOHANDMELEEWEAPON:
		weaponType = "twohandmelee";
		break;
	case SceneObjectType::WEAPON:
	case SceneObjectType::MELEEWEAPON:
		weaponType = "unarmed";
		break;
	case SceneObjectType::RIFLE:
		weaponType = "rifle";
		break;
	case SceneObjectType::PISTOL:
		weaponType = "pistol";
		break;
	case SceneObjectType::CARBINE:
		weaponType = "carbine";
		break;
	case SceneObjectType::POLEARM:
		weaponType = "polearm";
		break;
	case SceneObjectType::THROWNWEAPON:
		weaponType = "thrownweapon";
		break;
	case SceneObjectType::MINE:
	case SceneObjectType::SPECIALHEAVYWEAPON:
	case SceneObjectType::HEAVYWEAPON:
		weaponType = "heavyweapon";
		break;
	default:
		weaponType = "unarmed";
		break;
	}

	if (isJediOneHandedWeapon()) weaponType = "onehandlightsaber";
	if (isJediTwoHandedWeapon()) weaponType = "twohandlightsaber";
	if (isJediPolearmWeapon()) weaponType = "polearmlightsaber";

	return weaponType;
}

void WeaponObjectImplementation::fillAttributeList(AttributeListMessage* alm, CreatureObject* object) {
	TangibleObjectImplementation::fillAttributeList(alm, object);

	bool res = isCertifiedFor(object);

	if (res) {
		alm->insertAttribute("weapon_cert_status", "Yes");
	} else {
		alm->insertAttribute("weapon_cert_status", "No");
	}

	/*if (usesRemaining > 0)
		alm->insertAttribute("count", usesRemaining);*/

	for(int i = 0; i < wearableSkillMods.size(); ++i) {
		const String& key = wearableSkillMods.elementAt(i).getKey();
		String statname = "cat_skill_mod_bonus.@stat_n:" + key;
		int value = wearableSkillMods.get(key);

		if (value > 0)
			alm->insertAttribute(statname, value);
	}

//	String ap;

//	switch (armorPiercing) {
//	case SharedWeaponObjectTemplate::NONE:
//		ap = "None";
//		break;
//	case SharedWeaponObjectTemplate::LIGHT:
//		ap = "Light";
//		break;
//	case SharedWeaponObjectTemplate::MEDIUM:
//		ap = "Medium";
//		break;
//	case SharedWeaponObjectTemplate::HEAVY:
//		ap = "Heavy";
//		break;
//	default:
//		ap = "Unknown";
//		break;
//	}

//	alm->insertAttribute("wpn_armor_pierce_rating", ap);

	alm->insertAttribute("wpn_attack_speed", Math::getPrecision(getAttackSpeed(), 1));

	if (getDamageRadius() != 0.0f)
		alm->insertAttribute("area", Math::getPrecision(getDamageRadius(), 0));

	//Damage Information
	StringBuffer dmgtxt;

	switch (damageType) {
	case SharedWeaponObjectTemplate::KINETIC:
		dmgtxt << "Kinetic";
		break;
	case SharedWeaponObjectTemplate::ENERGY:
		dmgtxt << "Energy";
		break;
	case SharedWeaponObjectTemplate::ELECTRICITY:
		dmgtxt << "Electricity";
		break;
	case SharedWeaponObjectTemplate::STUN:
		dmgtxt << "Stun";
		break;
	case SharedWeaponObjectTemplate::BLAST:
		dmgtxt << "Blast";
		break;
	case SharedWeaponObjectTemplate::HEAT:
		dmgtxt << "Heat";
		break;
	case SharedWeaponObjectTemplate::COLD:
		dmgtxt << "Cold";
		break;
	case SharedWeaponObjectTemplate::ACID:
		dmgtxt << "Acid";
		break;
	case SharedWeaponObjectTemplate::LIGHTSABER:
		dmgtxt << "Lightsaber";
		break;
	default:
		dmgtxt << "Unknown";
		break;
	}

	alm->insertAttribute("damage.wpn_damage_type", dmgtxt);

	float minDmg = round(getMinDamage());
	float maxDmg = round(getMaxDamage());

//	alm->insertAttribute("damage.wpn_damage_min", minDmg);

//	alm->insertAttribute("damage.wpn_damage_max", maxDmg);

	StringBuffer damageRange;

	damageRange << minDmg << " - " << maxDmg;

	alm->insertAttribute("damage.damage", damageRange);

	alm->insertAttribute("damage.wpn_dps", Math::getPrecision((getMinDamage() + getMaxDamage()) / (getAttackSpeed() * 2), 1));

	StringBuffer woundsratio;

	float wnd = round(10 * getWoundsRatio()) / 10.0f;

	woundsratio << wnd << "%";

	alm->insertAttribute("damage.wpn_wound_chance", woundsratio);

	//Accuracy Modifiers
	StringBuffer pblank;
	if (getPointBlankAccuracy() >= 0)
		pblank << "+";

	pblank << getPointBlankAccuracy() << " @ " << getPointBlankRange() << "m";
	alm->insertAttribute("cat_wpn_rangemods.wpn_range_zero", pblank);

	StringBuffer ideal;
	if (getIdealAccuracy() >= 0)
		ideal << "+";

	ideal << getIdealAccuracy() << " @ " << getIdealRange() << "m";
	alm->insertAttribute("cat_wpn_rangemods.wpn_range_mid", ideal);

	StringBuffer maxrange;
	if (getMaxRangeAccuracy() >= 0)
		maxrange << "+";

	maxrange << getMaxRangeAccuracy() << " @ " << getMaxRange() << "m";
	alm->insertAttribute("cat_wpn_rangemods.wpn_range_max", maxrange);

	//Special Attack Costs
	alm->insertAttribute("cat_wpn_attack_cost.health", getHealthAttackCost());

	alm->insertAttribute("cat_wpn_attack_cost.action", getActionAttackCost());

	alm->insertAttribute("cat_wpn_attack_cost.mind", getMindAttackCost());

	//Anti Decay Kit
	if(hasAntiDecayKit()){
		alm->insertAttribute("@veteran_new:antidecay_examine_title", "@veteran_new:antidecay_examine_text");
	}

	// Force Cost
	if (getForceCost() > 0)
		alm->insertAttribute("forcecost", (int)getForceCost());

	for (int i = 0; i < getNumberOfDots(); i++) {

			String dt;

			switch (getDotType(i)) {
			case 1:
				dt = "Poison";
				break;
			case 2:
				dt = "Disease";
				break;
			case 3:
				dt = "Fire";
				break;
			case 4:
				dt = "Bleeding";
				break;
			default:
				dt = "Unknown";
				break;
			}

			StringBuffer type;
			type << "cat_wpn_dot_0" << i << ".wpn_dot_type";
			alm->insertAttribute(type.toString(), dt);

			String da;

			switch (getDotAttribute(i)) {
			case 0:
				da = "Health";
				break;
			case 1:
				da = "Strength";
				break;
			case 2:
				da = "Constitution";
				break;
			case 3:
				da = "Action";
				break;
			case 4:
				da = "Quickness";
				break;
			case 5:
				da = "Stamina";
				break;
			case 6:
				da = "Mind";
				break;
			case 7:
				da = "Focus";
				break;
			case 8:
				da = "Willpower";
				break;
			default:
				da = "Unknown";
				break;
			}

			StringBuffer attrib;
			attrib << "cat_wpn_dot_0" << i << ".wpn_dot_attrib";
			alm->insertAttribute(attrib.toString(), da);

			StringBuffer str;
			str << "cat_wpn_dot_0" << i << ".wpn_dot_strength";
			alm->insertAttribute(str.toString(), getDotStrength(i));

			StringBuffer dotDur;
			dotDur << getDotDuration(i) << "s";
			StringBuffer dur;
			dur << "cat_wpn_dot_0" << i << ".wpn_dot_duration";
			alm->insertAttribute(dur.toString(), dotDur);

			StringBuffer dotPot;
			dotPot << getDotPotency(i) << "%";
			StringBuffer pot;
			pot << "cat_wpn_dot_0" << i << ".wpn_dot_potency";
			alm->insertAttribute(pot.toString(), dotPot);

			StringBuffer use;
			use << "cat_wpn_dot_0" << i << ".wpn_dot_uses";
			alm->insertAttribute(use.toString(), getDotUses(i));
		}

	if (hasPowerup())
		powerupObject->fillWeaponAttributeList(alm, _this.getReferenceUnsafeStaticCast());

	if (sliced == 1)
		alm->insertAttribute("wpn_attr", "@obj_attr_n:hacked1");


//	alm->insertAttribute("damage.pistol_mode", getPistolMode());
//	alm->insertAttribute("damage.carbine_mode", getCarbineMode());
//	alm->insertAttribute("damage.rifle_mode", getRifleMode());

}

int WeaponObjectImplementation::getPointBlankAccuracy(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return pointBlankAccuracy + (abs(pointBlankAccuracy) * powerupObject->getPowerupStat("pointBlankAccuracy"));

	return pointBlankAccuracy;
}

int WeaponObjectImplementation::getPointBlankRange(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return pointBlankRange + (abs(pointBlankRange) * powerupObject->getPowerupStat("pointBlankRange"));

	return pointBlankRange;
}

int WeaponObjectImplementation::getIdealRange(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return idealRange + (abs(idealRange) * powerupObject->getPowerupStat("idealRange"));

	return idealRange;
}

int WeaponObjectImplementation::getMaxRange(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return maxRange + (abs(maxRange) * powerupObject->getPowerupStat("maxRange"));

	return maxRange;
}

int WeaponObjectImplementation::getIdealAccuracy(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return idealAccuracy + (abs(idealAccuracy) * powerupObject->getPowerupStat("idealAccuracy"));

	return idealAccuracy;
}


int WeaponObjectImplementation::getMaxRangeAccuracy(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return maxRangeAccuracy + (abs(maxRangeAccuracy) * powerupObject->getPowerupStat("maxRangeAccuracy"));

	return maxRangeAccuracy;
}

float WeaponObjectImplementation::getAttackSpeed(bool withPup) const {
	float speed = attackSpeed;

	if (sliced)
		speed *= speedSlice;

	if (powerupObject != nullptr && withPup)
		speed -= (speed * powerupObject->getPowerupStat("attackSpeed"));

	float calcSpeed = speed + getConditionReduction(speed);

	if (calcSpeed < 0.1f)
		calcSpeed = 0.1f;

	return calcSpeed;
}


float WeaponObjectImplementation::getMaxDamage(bool withPup) const {
	float damage = maxDamage;

	if (sliced)
		damage *= damageSlice;

	if (powerupObject != nullptr && withPup) {
		damage += (damage * powerupObject->getPowerupStat("maxDamage"));
		return damage - getConditionReduction(damage);
	}

	return damage - getConditionReduction(damage);
}

float WeaponObjectImplementation::getMinDamage(bool withPup) const {
	float damage = minDamage;

	if (sliced)
		damage *= damageSlice;

	if (powerupObject != nullptr && withPup) {
		damage += (damage * powerupObject->getPowerupStat("minDamage"));
		return damage - getConditionReduction(damage);
	}

	return damage - getConditionReduction(damage);
}

float WeaponObjectImplementation::getWoundsRatio(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return woundsRatio + (woundsRatio * powerupObject->getPowerupStat("woundsRatio"));

	return woundsRatio;
}

float WeaponObjectImplementation::getDamageRadius(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return damageRadius + (damageRadius * powerupObject->getPowerupStat("damageRadius"));

	return damageRadius;
}


int WeaponObjectImplementation::getHealthAttackCost(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return healthAttackCost - (abs(healthAttackCost) * powerupObject->getPowerupStat("healthAttackCost"));

	return healthAttackCost;
}

int WeaponObjectImplementation::getActionAttackCost(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return actionAttackCost - (abs(actionAttackCost) * powerupObject->getPowerupStat("actionAttackCost"));

	return actionAttackCost;
}

int WeaponObjectImplementation::getMindAttackCost(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return mindAttackCost - (abs(mindAttackCost) * powerupObject->getPowerupStat("mindAttackCost"));

	return mindAttackCost;
}

void WeaponObjectImplementation::updateCraftingValues(CraftingValues* values, bool firstUpdate) {
	/*
	 * Incoming Values:					Ranges:
	 * mindamage						Differs between weapons
	 * maxdamage
	 * attackspeed
	 * woundchance
	 * roundsused
	 * hitpoints
	 * zerorangemod
	 * maxrange
	 * maxrangemod
	 * midrange
	 * midrangemod
	 * charges
	 * attackhealthcost
	 * attackactioncost
	 * attackmindcost
	 */
	float value = 0.f;
	setMinDamage(Math::max(values->getCurrentValue("mindamage"), 0.f));
	setMaxDamage(Math::max(values->getCurrentValue("maxdamage"), 0.f));

	setAttackSpeed(values->getCurrentValue("attackspeed"));
	setHealthAttackCost((int)values->getCurrentValue("attackhealthcost"));
	setActionAttackCost((int)values->getCurrentValue("attackactioncost"));
	setMindAttackCost((int)values->getCurrentValue("attackmindcost"));

	if (isJediWeapon()) {
		setForceCost(Math::getPrecision(values->getCurrentValue("forcecost"), 1));
		setBladeColor(31);
	}

	value = values->getCurrentValue("woundchance");
	if (value != ValuesMap::VALUENOTFOUND)
		setWoundsRatio(value);

	//value = craftingValues->getCurrentValue("roundsused");
	//if(value != DraftSchematicValuesImplementation::VALUENOTFOUND)
		//_this.getReferenceUnsafeStaticCast()->set_______(value);

	value = values->getCurrentValue("zerorangemod");
	if (value != ValuesMap::VALUENOTFOUND)
		setPointBlankAccuracy((int)value);

	value = values->getCurrentValue("maxrange");
	if (value != ValuesMap::VALUENOTFOUND)
		setMaxRange((int)value);

	value = values->getCurrentValue("maxrangemod");
	if (value != ValuesMap::VALUENOTFOUND)
		setMaxRangeAccuracy((int)value);

	value = values->getCurrentValue("midrange");
	if (value != ValuesMap::VALUENOTFOUND)
		setIdealRange((int)value);

	value = values->getCurrentValue("midrangemod");
	if (value != ValuesMap::VALUENOTFOUND)
		setIdealAccuracy((int)value);

	//value = craftingValues->getCurrentValue("charges");
	//if(value != CraftingValues::VALUENOTFOUND)
	//	setUsesRemaining((int)value);

	value = values->getCurrentValue("hitpoints");
	if (value != ValuesMap::VALUENOTFOUND)
		setMaxCondition((int)value);

	setConditionDamage(0);
}

bool WeaponObjectImplementation::isCertifiedFor(CreatureObject* object) const {
	ManagedReference<PlayerObject*> ghost = object->getPlayerObject();

	if (ghost == nullptr)
		return false;

	const auto certificationsRequired = weaponTemplate->getCertificationsRequired();

	for (int i = 0; i < certificationsRequired->size(); ++i) {
		const String& cert = certificationsRequired->get(i);

		if (!ghost->hasAbility(cert) && !object->hasSkill(cert)) {
			return false;
		}
	}

	return true;
}

void WeaponObjectImplementation::decreasePowerupUses(CreatureObject* player) {
	if (hasPowerup()) {
		powerupObject->decreaseUses();

		if (powerupObject->getUses() < 1) {
			Locker locker(_this.getReferenceUnsafeStaticCast());
			StringIdChatParameter message("powerup", "prose_pup_expire"); //The powerup on your %TT has expired.
			message.setTT(getDisplayedName());

			player->sendSystemMessage(message);

			ManagedReference<PowerupObject*> pup = removePowerup();

			if (pup != nullptr) {
				Locker plocker(pup);

				pup->destroyObjectFromWorld( true );
				pup->destroyObjectFromDatabase( true );
			}
		}

		sendAttributeListTo(player);
	}
}

String WeaponObjectImplementation::repairAttempt(int repairChance) {
	String message = "@error_message:";

	if(repairChance < 5) {
		message += "sys_repair_failed";
		setMaxCondition(1, true);
		setConditionDamage(0, true);
	} else if(repairChance < 50) {
		message += "sys_repair_imperfect";
		setMaxCondition(getMaxCondition() * .75f, true);
		setConditionDamage(0, true);
	} else if(repairChance < 75) {
		setMaxCondition(getMaxCondition() * .90f, true);
		setConditionDamage(0, true);
		message += "sys_repair_slight";
	} else {
		setMaxCondition(getMaxCondition() * 0.99f, true);
		setConditionDamage(0, true);
		message += "sys_repair_perfect";
	}

	return message;
}

void WeaponObjectImplementation::decay(CreatureObject* user) {
	if (_this.getReferenceUnsafeStaticCast() == user->getSlottedObject("default_weapon") || user->isAiAgent() || hasAntiDecayKit()) {
		return;
	}

	int roll = System::random(100);
	int chance = 40;

	if (hasPowerup())
		chance += 10;

	if (roll < chance) {
		Locker locker(_this.getReferenceUnsafeStaticCast());

		if (isJediWeapon()) {
			ManagedReference<SceneObject*> saberInv = getSlottedObject("saber_inv");

			if (saberInv == nullptr)
				return;

			// TODO: is this supposed to be every crystal, or random crystal(s)?
			for (int i = 0; i < saberInv->getContainerObjectsSize(); i++) {
				ManagedReference<LightsaberCrystalComponent*> crystal = saberInv->getContainerObject(i).castTo<LightsaberCrystalComponent*>();

				if (crystal != nullptr) {
					crystal->inflictDamage(crystal, 0, 1, true, true);
				}
			}
		} else {
			if (getWeaponType() == "rifle")
				inflictDamage(_this.getReferenceUnsafeStaticCast(), 0, 2, true, true);
			else if (getWeaponType() == "carbine")
				inflictDamage(_this.getReferenceUnsafeStaticCast(), 0, (1 + System::random(1)), true, true);
			else
				inflictDamage(_this.getReferenceUnsafeStaticCast(), 0, 1, true, true);

			if (((float)conditionDamage - 1 / (float)maxCondition < 0.75) && ((float)conditionDamage / (float)maxCondition > 0.75))
				user->sendSystemMessage("@combat_effects:weapon_quarter");
			if (((float)conditionDamage - 1 / (float)maxCondition < 0.50) && ((float)conditionDamage / (float)maxCondition > 0.50))
				user->sendSystemMessage("@combat_effects:weapon_half");
		}
	}
}

bool WeaponObjectImplementation::isEquipped() {
	ManagedReference<SceneObject*> parent = getParent().get();
	if (parent != nullptr && parent->isPlayerCreature())
		return true;

	return false;
}

void WeaponObjectImplementation::applySkillModsTo(CreatureObject* creature) const {
	if (creature == nullptr) {
		return;
	}

	for (int i = 0; i < wearableSkillMods.size(); ++i) {
		const String& name = wearableSkillMods.elementAt(i).getKey();
		int value = wearableSkillMods.get(name);

		if (!SkillModManager::instance()->isWearableModDisabled(name)) {
			creature->addSkillMod(SkillModManager::WEARABLE, name, value, true);
			creature->updateTerrainNegotiation();
		}
	}

	SkillModManager::instance()->verifyWearableSkillMods(creature);
}

void WeaponObjectImplementation::removeSkillModsFrom(CreatureObject* creature) {
	if (creature == nullptr) {
		return;
	}

	for (int i = 0; i < wearableSkillMods.size(); ++i) {
		const String& name = wearableSkillMods.elementAt(i).getKey();
		int value = wearableSkillMods.get(name);

		if (!SkillModManager::instance()->isWearableModDisabled(name)) {
			creature->removeSkillMod(SkillModManager::WEARABLE, name, value, true);
			creature->updateTerrainNegotiation();
		}
	}

	SkillModManager::instance()->verifyWearableSkillMods(creature);
}

bool WeaponObjectImplementation::applyPowerup(CreatureObject* player, PowerupObject* pup) {
	if (hasPowerup())
		return false;

	addMagicBit(true);

	powerupObject = pup;

	if (pup->getParent() != nullptr) {
		Locker clocker(pup, player);
		pup->destroyObjectFromWorld(true);
	}

	sendAttributeListTo(player);

	return true;
}

Reference<PowerupObject*> WeaponObjectImplementation::removePowerup() {
	if (!hasPowerup())
		return nullptr;

	auto pup = powerupObject;
	powerupObject = nullptr;

	removeMagicBit(true);

	return pup;
}

//function to convert a weapon into a different weapon
//written by Skyyyr for the E-11; converted by Halyn for generic use
void WeaponObjectImplementation::convertWeapon(CreatureObject* player, String& newWeaponTemplate) {
	//First we don't want it to be equiped while they attempt to change the 'variant'
	ManagedReference<SceneObject*> parent = getParent().get();//This is to check for equip or unequip
	if (parent != nullptr && parent->isPlayerCreature()){
		player->sendSystemMessage("You must unequip your weapon before changing its configuration.");
		return;
	}

	const String templatePath = newWeaponTemplate;

	ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");//Inventory check
	Reference<SharedObjectTemplate*> shot = TemplateManager::instance()->getTemplate(newWeaponTemplate.hashCode());
	ManagedReference<TangibleObject*> temp = (player->getZoneServer()->createObject(shot->getServerObjectCRC(), 1)).castTo<TangibleObject*>();

	WeaponObject* newWeapon = cast<WeaponObject*>(temp.get());//This is the new weapon

	//We don't want them to have the weapon equiped to make sure the weapon transfer works perfectly
	if (parent != nullptr && parent->isPlayerCreature()){
		player->sendSystemMessage("You must unequip your weapon before changing its configuration.");
		return;
	}
	//Don't want an issue with the object not exising or broken
	if (temp == nullptr) {
		return;
	}
	//Don't want to overload the inventroy
	if (inventory == nullptr || inventory->isContainerFullRecursive()) {
		player->sendSystemMessage("Your inventory is full.");
		return;
	}

	//calculate range modifier change for converting between pistols, carbines, and rifles
	int pointBlankAccuracyModifier = 0;
	int idealAccuracyModifier = 0;
	int idealRangeModifier = 0;
	int maxRangeAccuracyModifier = 0;
	String oldWeaponType = getWeaponType();
	String newWeaponType = newWeapon->getWeaponType();
	String crafterName = getCraftersName();

	if (oldWeaponType == "pistol" && newWeaponType == "rifle") {
		pointBlankAccuracyModifier = -140;
		idealAccuracyModifier = 40;
		idealRangeModifier = 25;
		maxRangeAccuracyModifier = 200;
	} else if (oldWeaponType == "pistol" && newWeaponType == "carbine") {
		pointBlankAccuracyModifier = -50;
		idealAccuracyModifier = 10;
		idealRangeModifier = 20;
		maxRangeAccuracyModifier = 20;
	} else if (oldWeaponType == "carbine" && newWeaponType == "pistol") {
		pointBlankAccuracyModifier = 50;
		idealAccuracyModifier = -10;
		idealRangeModifier = -20;
		maxRangeAccuracyModifier = -20;
	} else if (oldWeaponType == "carbine" && newWeaponType == "rifle") {
		pointBlankAccuracyModifier = -90;
		idealAccuracyModifier = 30;
		idealRangeModifier = 5;
		maxRangeAccuracyModifier = 180;
	} else if (oldWeaponType == "rifle" && newWeaponType == "pistol") {
		pointBlankAccuracyModifier = 140;
		idealAccuracyModifier = -40;
		idealRangeModifier = -25;
		maxRangeAccuracyModifier = -200;
	} else if (oldWeaponType == "rifle" && newWeaponType == "carbine") {
		pointBlankAccuracyModifier = 90;
		idealAccuracyModifier = -30;
		idealRangeModifier = -5;
		maxRangeAccuracyModifier = -180;
	}


	//If Success then transfer item, configure new weapon using old weapon's information plus modifiers, and delete old weapon.
	Locker locker(temp);
	if (inventory->transferObject(temp, -1, true)) {
		inventory->broadcastObject(temp, true);
		newWeapon->setMinDamage(getMinDamage(false) / getDamageSlice());
		newWeapon->setMaxDamage(getMaxDamage(false) / getDamageSlice());
		newWeapon->setAttackSpeed(getAttackSpeed(false) / getSpeedSlice());
		newWeapon->setManualSpeedSlice(getSpeedSlice());
		newWeapon->setManualDamageSlice(getDamageSlice());
		newWeapon->setWoundsRatio(getWoundsRatio(false));
		newWeapon->setHealthAttackCost(getHealthAttackCost(false));
		newWeapon->setActionAttackCost(getActionAttackCost(false));
		newWeapon->setMindAttackCost(getMindAttackCost(false));
		newWeapon->setMaxRangeAccuracy(getMaxRangeAccuracy(false) + maxRangeAccuracyModifier);
		newWeapon->setIdealAccuracy(getIdealAccuracy(false) + idealAccuracyModifier);
		newWeapon->setMaxRange(getMaxRange(false));
		newWeapon->setIdealRange(getIdealRange(false) + idealRangeModifier);
		newWeapon->setPointBlankAccuracy(getPointBlankAccuracy(false) + pointBlankAccuracyModifier);
		newWeapon->setSliced(isSliced());
		newWeapon->setSerialNumber(getSerialNumber());
		newWeapon->setCraftersName(crafterName);
		newWeapon->setMaxCondition(getMaxCondition());
		newWeapon->setConditionDamage(getConditionDamage());
		if (hasPowerup())
			newWeapon->applyPowerup(player, removePowerup());
		destroyObjectFromWorld(true);
		destroyObjectFromDatabase(true);
		return;
	}
	return;
}
