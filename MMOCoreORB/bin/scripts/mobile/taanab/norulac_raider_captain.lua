norulac_raider_captain = Creature:new {
	objectName = "@mob/creature_names:norulac_raider_captain",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "norulac",
	faction = "norulac_raiders",
	level = 107,
	chanceHit = 1.75,
	damageMin = 670,
	damageMax = 1050,
	baseXp = 10081,
	baseHAM = 29000,
	baseHAMmax = 36000,
	armor = 2,
	resists = {55,55,70,45,75,80,55,45,-1},
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
	creatureBitmask = KILLER + PACK,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_squad_leader_trainer_01.iff",
		     "object/mobile/dressed_squad_leader_trainer_02.iff",
	             "object/mobile/dressed_squad_leader_trainer_03.iff"
		
	},

	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 4500000},
				{group = "pistols", chance = 1500000},
				{group = "rifles", chance = 1500000},
				{group = "carbines", chance = 1500000},
				{group = "melee_weapons", chance = 500000},
				{group = "clothing_attachments", chance = 500000}
			}
		}
	},
	weapons = {"dark_trooper_weapons"},
	conversationTemplate = "",
	attacks = merge(bountyhuntermaster,marksmanmaster,brawlermaster,swordsmanmaster,pistoleermaster)
}

CreatureTemplates:addCreatureTemplate(norulac_raider_captain, "norulac_raider_captain")
