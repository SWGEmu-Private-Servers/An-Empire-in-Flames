darth_caedus_follower = Creature:new {
	objectName = "",
	customName = "Darth Caedus Follower",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 265,
	chanceHit = 235,
	damageMin = 1645,
	damageMax = 3000,
	baseXp = 25266,
	baseHAM = 500000,
	baseHAMmax = 500000,
	armor = 3,
	resists = {90,90,90,90,90,90,90,90,55},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_dark_jedi_human_male_01.iff",
		"object/mobile/dressed_dark_jedi_human_female_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "task_loot_sith_altar", chance = 10000000}
			},
			lootChance = 10000000
		}
	},
	weapons = {"dark_jedi_weapons_gen3"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster)
}

CreatureTemplates:addCreatureTemplate(darth_caedus_follower, "darth_caedus_follower")