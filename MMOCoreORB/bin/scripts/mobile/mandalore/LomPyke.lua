lom_pyke = Creature:new {
	objectName = "",
	customName = "Lom Pyke",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 225,
	chanceHit = 5,
	damageMin = 520,
	damageMax = 1750,
	baseXp = 10000,
	baseHAM = 1500000,
	baseHAMmax = 1500000,
	armor = 3,
	resists = {80,80,90,80,75,75,90,70,97},
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
	creatureBitmask = KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_black_sun_henchman.iff"},
	lootGroups = {
         {
			groups = {
				{group = "junk", chance = 6500000},
				{group = "pistols", chance = 1000000},
				{group = "rifles", chance = 1000000},
				{group = "carbines", chance = 1000000},
				{group = "jetpack_parts", chance = 500000},				
--				{group = "bounty_hunter_armor_looted", chance = 700000},
--				{group = "jetpack_base", chance = 50000},
			},
			lootChance = 3500000
		}	
	},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(lom_pyke, "lom_pyke")
