mandalore_the_resurrector = Creature:new {
	objectName = "",
	customName = "Mandalore the Resurrector",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 250,
	chanceHit = 190,
	damageMin = 1245,
	damageMax = 2200,
	baseXp = 20948,
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

	templates = {"object/mobile/dressed_death_watch_red.iff"},
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

CreatureTemplates:addCreatureTemplate(mandalore_the_resurrector, "mandalore_the_resurrector")