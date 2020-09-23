c1 = Creature:new {
	objectName = "@mob/creature_names:c1",
	randomNameType = NAME_C1,
	socialGroup = "townsperson",
	faction = "townsperson",
	level = 4,
	chanceHit = 0.24,
	damageMin = 40,
	damageMax = 45,
	baseXp = 62,
	baseHAM = 113,
	baseHAMmax = 138,
	armor = 0,
	resists = {15,15,15,15,15,15,15,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/c1.iff"
	},
	hues = { 6, 12, 34, 55, 60, 63, 75, 77, 83, 84, 90, 93, 97, 98, 101, 104, 124, 114, 118, 126, 132, 133, 144, 147, 151, 153, 154, 160, 161, 167, 174, 175, 181, 182, 189, 194, 197, 201, 204, 209, 210, 216, 217, 220, 223, 231, 235, 243, 242, 244, 245, 249, 251, 253, 254, 255, 252 },	
	scale = 1.0,
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(c1, "c1")
