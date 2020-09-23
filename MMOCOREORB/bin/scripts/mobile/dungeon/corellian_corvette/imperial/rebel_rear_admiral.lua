rebel_rear_admiral = Creature:new {
	objectName = "@mob/creature_names:corvette_rebel_rear_admiral",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "rebel",
	faction = "rebel",
	level = 226,
	chanceHit = 19.75,
	damageMin = 1270,
	damageMax = 2250,
	baseXp = 21533,
	baseHAM = 20800,
	baseHAMmax = 25400,
	armor = 0,
	resists = {90,90,70,90,90,110,70,110,90},
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


	templates = {"object/mobile/dressed_rebel_high_general_sullustan_male_01.iff",
		"object/mobile/dressed_rebel_high_general_old_twilek_female_01.iff",
		"object/mobile/dressed_rebel_high_general_human_male_02.iff",
		"object/mobile/dressed_rebel_high_general_human_female_01.iff",
		"object/mobile/dressed_rebel_high_general_moncal_male_01.iff"
	},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 100000},
				{group = "junk", chance = 4700000},
				{group = "rifles", chance = 1000000},
				{group = "pistols", chance = 1000000},
				{group = "melee_weapons", chance = 1000000},
				{group = "carbines", chance = 1000000},
				{group = "clothing_attachments", chance = 100000},
				{group = "armor_attachments", chance = 100000},
				{group = "wearables_common", chance = 500000},
				{group = "wearables_uncommon", chance = 500000}
			}
		}
	},
	weapons = {"rebel_weapons_heavy"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	attacks = merge(commandomaster,marksmanmaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(rebel_rear_admiral, "rebel_rear_admiral")
