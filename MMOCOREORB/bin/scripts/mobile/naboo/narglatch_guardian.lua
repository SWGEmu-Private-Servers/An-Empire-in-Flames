narglatch_guardian = Creature:new {
	objectName = "@mob/creature_names:narglatch_guardian",
	socialGroup = "narglatch",
	faction = "",
	level = 25,
	chanceHit = 0.35,
	damageMin = 225,
	damageMax = 250,
	baseXp = 2822,
	baseHAM = 7300,
	baseHAMmax = 9300,
	armor = 0,
	resists = {125,125,20,-1,15,165,-1,-1,-1},
	meatType = "meat_carnivore",
	meatAmount = 60,
	hideType = "hide_bristley",
	hideAmount = 35,
	boneType = "bone_mammal",
	boneAmount = 35,
	milk = 0,
	tamingChance = 0.25,
	ferocity = 9,
	passengerCapacity = 1,
	passengerSeatString = "cat",
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,


	templates = {"object/mobile/narglatch_hue.iff"},
	controlDeviceTemplate = "object/intangible/pet/narglatch_hue.iff",
	scale = 1.15,
	hues = { 24, 25, 26, 27, 28, 29, 30, 31 },
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"intimidationattack",""},
		{"stunattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(narglatch_guardian, "narglatch_guardian")
