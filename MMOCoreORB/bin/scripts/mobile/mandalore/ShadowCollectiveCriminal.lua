shadow_collective_criminal = Creature:new {
	objectName = "",
	customName = "Shadow Collective Criminal",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 150,
	chanceHit = 30,
	damageMin = 500,
	damageMax = 1000,
	baseXp = 10000,
	baseHAM = 95000,
	baseHAMmax = 95000,
	armor = 3,
	resists = {65,65,75,65,50,40,95,50,75},
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

	templates = {"object/mobile/dressed_black_sun_thug.iff"},
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

CreatureTemplates:addCreatureTemplate(shadow_collective_criminal, "shadow_collective_criminal")
