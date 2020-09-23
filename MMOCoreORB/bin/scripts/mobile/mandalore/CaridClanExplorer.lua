carid_clan_explorer = Creature:new {
	objectName = "",
	customName = "Carid Clan Explorer",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 178,
	chanceHit = 122.5,
	damageMin = 1020,
	damageMax = 1750,
	baseXp = 16794,
	baseHAM = 120000,
	baseHAMmax = 120000,
	armor = 2,
	resists = {75,75,90,80,45,45,75,70,75},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/boba_fett.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners",   chance = 6300000},
				{group = "death_watch_bunker_lieutenants", chance = 3500000},
				{group = "death_watch_bunker_ingredient_protective",  chance = 100000},
				{group = "death_watch_bunker_ingredient_binary",  chance = 100000}
			},
			lootChance = 1500000
		}
	},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = {
		{"defaultattack", ""},
		{"intimidationattack","intimidationChance=50"},
		{"knockdownattack","knockdownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(carid_clan_explorer, "carid_clan_explorer")