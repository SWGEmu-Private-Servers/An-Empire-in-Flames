purbole_elder = Creature:new {
	objectName = "@mob/creature_names:purbole_elder",
	socialGroup = "purbole",
	faction = "",
	level = 24,
	chanceHit = 0.35,
	damageMin = 190,
	damageMax = 200,
	baseXp = 2443,
	baseHAM = 7700,
	baseHAMmax = 9400,
	armor = 0,
	resists = {40,40,60,40,40,60,30,30,40},
	meatType = "meat_carnivore",
	meatAmount = 15,
	hideType = "hide_bristley",
	hideAmount = 11,
	boneType = "bone_mammal",
	boneAmount = 11,
	milk = 0,
	tamingChance = 0,
	ferocity = 7,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/purbole_elder.iff"},
	hues = { 24, 25, 26, 27, 28, 29, 30, 31 },
	scale = 1.15,
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"posturedownattack",""},
		{"stunattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(purbole_elder, "purbole_elder")
