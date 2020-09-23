bordok_mare = Creature:new {
	objectName = "@mob/creature_names:bordok_mare",
	socialGroup = "bordok",
	faction = "",
	level = 34,
	chanceHit = 0.41,
	damageMin = 340,
	damageMax = 390,
	baseXp = 3460,
	baseHAM = 8700,
	baseHAMmax = 10700,
	armor = 0,
	resists = {30,30,20,20,20,20,20,20,30},
	meatType = "meat_herbivore",
	meatAmount = 275,
	hideType = "hide_leathery",
	hideAmount = 200,
	boneType = "bone_mammal",
	boneAmount = 125,
	milkType = "milk_wild",
	milk = 135,
	tamingChance = 0.1,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/bordok_hue.iff"},
	controlDeviceTemplate = "object/intangible/pet/bordok_hue.iff",
	hues = { 8, 9, 10, 11, 12, 13, 14, 15 },
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"stunattack",""},
		{"creatureareaknockdown",""}
	}
}

CreatureTemplates:addCreatureTemplate(bordok_mare, "bordok_mare")
