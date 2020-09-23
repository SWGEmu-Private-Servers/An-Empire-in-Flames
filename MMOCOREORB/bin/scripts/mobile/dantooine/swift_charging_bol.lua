swift_charging_bol = Creature:new {
	objectName = "@mob/creature_names:bol_swift_charger",
	socialGroup = "bol",
	faction = "",
	level = 34,
	chanceHit = 0.41,
	damageMin = 310,
	damageMax = 330,
	baseXp = 3370,
	baseHAM = 8700,
	baseHAMmax = 10700,
	armor = 0,
	resists = {25,25,15,25,25,15,45,45,25},
	meatType = "meat_herbivore",
	meatAmount = 180,
	hideType = "hide_leathery",
	hideAmount = 300,
	boneType = "bone_mammal",
	boneAmount = 180,
	milk = 0,
	tamingChance = 0.05,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/bol_hue.iff"},
	controlDeviceTemplate = "object/intangible/pet/bol_hue.iff",
	scale = 1.1,
	lootGroups = {
		{
	        groups = {
				{group = "bol", chance = 10000000},

			},
			lootChance = 25000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"knockdownattack",""},
		{"stunattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(swift_charging_bol, "swift_charging_bol")
