ambrian_staga_female = Creature:new {
	objectName = "@mob/creature_names:ambrian_staga_female",
	socialGroup = "ambrian_staga",
	faction = "",
	level = 14,
	chanceHit = 0.31,
	damageMin = 140,
	damageMax = 160,
	baseXp = 1102,
	baseHAM = 3500,
	baseHAMmax = 4300,
	armor = 0,
	resists = {5,5,5,-1,-1,125,125,-1,-1},
	meatType = "meat_herbivore",
	meatAmount = 55,
	hideType = "hide_bristley",
	hideAmount = 35,
	boneType = "bone_mammal",
	boneAmount = 55,
	milkType = "milk_wild",
	milk = 125,
	tamingChance = 0.10,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = 0,
	diet = HERBIVORE,

	templates = {"object/mobile/verne.iff"},
	controlDeviceTemplate = "object/intangible/pet/verne_hue.iff",
	scale = 0.8,
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"",""},
		{"stunattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(ambrian_staga_female, "ambrian_staga_female")
