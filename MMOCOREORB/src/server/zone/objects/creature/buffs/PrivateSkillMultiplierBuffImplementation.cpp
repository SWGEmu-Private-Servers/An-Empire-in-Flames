/*
 * PrivateSkillMultiplierBuffImplementation.cpp
 *
 *  Created on: Mar 20, 2015
 *      Author: swgemu
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/managers/objectcontroller/ObjectController.h"
#include "server/zone/objects/creature/buffs/PrivateSkillMultiplierBuff.h"

void PrivateSkillMultiplierBuffImplementation::applySkillModifiers() {

/*	Logger adminLog;
	adminLog.setLoggingName("SkillMods");
	StringBuffer fileName;
	fileName << "log/admin/skillMods.log";
	adminLog.setFileLogger(fileName.toString(), true);
	adminLog.setLogging(true);
*/
	ManagedReference<CreatureObject*> strongCreo = creature.get();
	if (strongCreo == nullptr)
		return;

	int size = skillModifiers.size();

	for (int i = 0; i < size; ++i) {
		VectorMapEntry<String, int>* entry = &skillModifiers.elementAt(i);

		String key = entry->getKey();
		int value = entry->getValue();

		if (value == 0)
			continue;

		int prevMod = strongCreo->getSkillMod(key);

		strongCreo->addSkillMod(SkillModManager::BUFF, key, prevMod == 0 ? value : prevMod*(value-1), true);
//		StringBuffer logEntry;
//		logEntry << strongCreo->getDisplayedName() << " Skill Mod: " << key
//									<< "' value: "  << strongCreo->getSkillMod(key) << "'";
//		adminLog.info(logEntry.toString());
	}

	creature.get()->updateSpeedAndAccelerationMods();
}

void PrivateSkillMultiplierBuffImplementation::removeSkillModifiers() {

/*	Logger adminLog;
	adminLog.setLoggingName("SkillMods");
	StringBuffer fileName;
	fileName << "log/admin/skillMods.log";
	adminLog.setFileLogger(fileName.toString(), true);
	adminLog.setLogging(true);
*/
	ManagedReference<CreatureObject*> strongCreo = creature.get();
	if (strongCreo == nullptr)
		return;

	int size = skillModifiers.size();

	for (int i = 0; i < size; ++i) {
		VectorMapEntry<String, int>* entry = &skillModifiers.elementAt(i);

		String key = entry->getKey();
		int value = entry->getValue();

		if (value == 0)
			continue;

		int prevMod = strongCreo->getSkillMod(key);
//	  StringBuffer logEntry;
		strongCreo->addSkillMod(SkillModManager::BUFF, key, prevMod <= value ? -prevMod : (int)(prevMod*((1/(float)(value))-1)), true);
//		logEntry << strongCreo->getDisplayedName() << " Skill Mod: " << key
//									<< "' value: "  << strongCreo->getSkillMod(key) << "'";
//		adminLog.info(logEntry.toString());
	}

	creature.get()->updateSpeedAndAccelerationMods();
}
