mythosaur = Creature:new {
	objectName = "",
	customName = "Mythosaur",
	socialGroup = "kimogila",
	pvpFaction = "",
	faction = "",
	level = 200,
	chanceHit = 8.5,
	damageMin = 1000,
	damageMax = 1750,
	baseXp = 15000,
	baseHAM = 1250000,
	baseHAMmax = 1250000,
	armor = 3,
	resists = {55,85,75,100,75,75,75,75,75},
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_leathery",
	hideAmount = 1000,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/giant_dune_kimogila.iff"},
	scale = 1.8,
	lootGroups = {
	 {
	        groups = {
				{group = "giant_dune_kimo_common", chance = 2000000},
				{group = "kimogila_common", chance = 8000000},
			},
			lootChance = 6500000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo",""},
		{"creatureareadisease",""}
	}
}

CreatureTemplates:addCreatureTemplate(mythosaur, "mythosaur")