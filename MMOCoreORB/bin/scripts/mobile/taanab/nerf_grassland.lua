nerf_grassland = Creature:new {
	objectName = "@mob/creature_names:nerf_grassland",
	socialGroup = "nerf",
	faction = "",
	level = 32,
	chanceHit = 0.39,
	damageMin = 270,
	damageMax = 290,
	baseXp = 3300,
	baseHAM = 10400,
	baseHAMmax = 12200,
	armor = 0,
	resists = {135,20,-1,20,20,-1,20,-1,-1},
	meatType = "meat_herbivore",
	meatAmount = 85,
	hideType = "hide_leathery",
	hideAmount = 75,
	boneType = "bone_mammal",
	boneAmount = 85,
	milk = 0,
	tamingChance = 0.05,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + ENEMY + AGGRESSIVE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/nerf.iff"},
	controlDeviceTemplate = "object/intangible/pet/nerf_hue.iff",
	scale = 1.2,
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"knockdownattack",""},
		{"stunattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(nerf_grassland, "nerf_grassland")
