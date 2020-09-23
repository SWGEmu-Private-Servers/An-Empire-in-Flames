vizsla_loyalist = Creature:new {
	objectName = "",
	customName = "Vizsla Loyalist",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 150,
	chanceHit = 40,
	damageMin = 800,
	damageMax = 1500,
	baseXp = 15000,
	baseHAM = 100000,
	baseHAMmax = 100000,
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

	templates = {"object/mobile/dressed_death_watch_gold.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_overlord_shared", chance =  10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "death_watch_bunker_overlord_shared", chance =  500000},
				{group = "death_watch_bunker_overlord_quest", chance  = 9500000}
			},
			lootChance = 5000000
		}
	},
	weapons = {"dark_trooper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(vizsla_loyalist, "vizsla_loyalist")