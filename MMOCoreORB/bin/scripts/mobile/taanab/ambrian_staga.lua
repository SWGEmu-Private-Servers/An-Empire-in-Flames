ambrian_staga = Creature:new {
	objectName = "@mob/creature_names:ambrian_staga",
	socialGroup = "ambrian_staga",
	faction = "",
	level = 17,
	chanceHit = 0.31,
	damageMin = 170,
	damageMax = 180,
	baseXp = 1102,
	baseHAM = 3500,
	baseHAMmax = 4300,
	armor = 0,
	resists = {5,5,5,-1,-1,125,125,-1,-1},
	meatType = "meat_herbivore",
	meatAmount = 65,
	hideType = "hide_bristley ",
	hideAmount = 45,
	boneType = "bone_mammal",
	boneAmount = 65,
	milk = 0,
	tamingChance = 0.10,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = 0,
	diet = HERBIVORE,

	templates = {"object/mobile/verne.iff"},
	controlDeviceTemplate = "object/intangible/pet/verne_hue.iff",
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"",""},
		{"intimidationattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(ambrian_staga, "ambrian_staga")
