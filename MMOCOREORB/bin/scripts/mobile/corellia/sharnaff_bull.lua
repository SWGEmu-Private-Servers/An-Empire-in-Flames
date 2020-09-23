sharnaff_bull = Creature:new {
	objectName = "@mob/creature_names:sharnaff_bull",
	socialGroup = "sharnaff",
	faction = "",
	level = 38,
	chanceHit = 0.41,
	damageMin = 335,
	damageMax = 380,
	baseXp = 3733,
	baseHAM = 9400,
	baseHAMmax = 11400,
	armor = 0,
	resists = {40,40,30,40,40,30,60,60,40},
	meatType = "meat_carnivore",
	meatAmount = 482,
	hideType = "hide_scaley",
	hideAmount = 335,
	boneType = "bone_mammal",
	boneAmount = 200,
	milk = 0,
	tamingChance = 0.1,
	ferocity = 8,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/sharnaff_bull.iff"},
	controlDeviceTemplate = "object/intangible/pet/sharnaff_hue.iff",
	hues = { 0, 1, 2, 3, 4, 5, 6, 7 },
	lootGroups = {
		{
			groups = {
				{group = "sharnaff_common", chance = 10000000}
			},
			lootChance = 1760000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"dizzyattack",""},
		{"stunattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(sharnaff_bull, "sharnaff_bull")
