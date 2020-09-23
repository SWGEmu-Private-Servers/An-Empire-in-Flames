spiderclan_sentry = Creature:new {
	objectName = "@mob/creature_names:spider_nightsister_sentry",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "spider_nightsister",
	faction = "spider_nightsister",
	level = 27,
	chanceHit = 0.33,
	damageMin = 190,
	damageMax = 200,
	baseXp = 2730,
	baseHAM = 5000,
	baseHAMmax = 6100,
	armor = 0,
	resists = {40,40,30,40,40,60,30,40,40},
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
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dathomir_spider_nightsister_guardian.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 1500000},
				{group = "power_crystals", chance = 500000},
				{group = "color_crystals", chance = 500000},
				{group = "armor_attachments", chance = 350000},
				{group = "clothing_attachments", chance = 350000},
				{group = "melee_weapons", chance = 2800000},
				{group = "pistols", chance = 1000000},
				{group = "rifles", chance = 1000000},
				{group = "carbines", chance = 1000000},
				{group = "wearables_common", chance = 1000000}
			}
		},
		{
			groups = {
				{group = "spiderclan_common", chance = 10000000},
			},
			lootChance = 166666
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(brawlermaster,pikemanmaster)
}

CreatureTemplates:addCreatureTemplate(spiderclan_sentry, "spiderclan_sentry")
