norulac_raider = Creature:new {
	objectName = "@mob/creature_names:norulac_raider",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "norulac",
	faction = "norulac_raiders",
	level = 86,
	chanceHit = 0.85,
	damageMin = 570,
	damageMax = 850,
	baseXp = 8130,
	baseHAM = 13000,
	baseHAMmax = 16000,
	armor = 1,
	resists = {40,40,60,35,55,70,35,40,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_mercenary_destroyer_hum_m.iff",
		"object/mobile/dressed_mercenary_destroyer_hum_f.iff"
	},

	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 3000000},
				{group = "pistols", chance = 2000000},
				{group = "rifles", chance = 2000000},
				{group = "carbines", chance = 2000000},
				{group = "melee_weapons", chance = 500000},
				{group = "clothing_attachments", chance = 500000}
			}
		}
	},
	weapons = {"ranged_weapons"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,marksmanmaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(norulac_raider, "norulac_raider")
