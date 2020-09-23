lesser_prophet_of_the_light_side = Creature:new {
	objectName = "@mob/creature_names:jedi_initiate",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "rebel",
	faction = "rebel",
	level = 85,
	chanceHit = 0.85,
	damageMin = 570,
	damageMax = 850,
	baseXp = 8130,
	baseHAM = 13000,
	baseHAMmax = 16000,
	armor = 1,
	resists = {40,40,40,40,40,40,40,40,40},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {	"object/mobile/dressed_jedi_female_togruta_01.iff",
			"object/mobile/dressed_jedi_female_togruta_02.iff",
			"object/mobile/dressed_jedi_male_duros.iff",
			"object/mobile/dressed_jedi_male_gungan.iff",
			"object/mobile/dressed_jedi_male_iktotchi.iff",
			"object/mobile/dressed_jedi_male_nikto.iff",
			"object/mobile/dressed_jedi_male_weequay.iff",
			"object/mobile/dressed_jedi_male_wookiee.iff",
	},
	lootGroups = {
		{
			groups = {
				{group = "armor_attachments", chance = 3000000},
				{group = "clothing_attachments", chance = 3000000},
				{group = "wearables_rare", chance = 4000000}
			},
			lootChance = 2500000
		}
	},
	weapons = {"vortex_weapons"},
	conversationTemplate = "",
	attacks = merge(swordsmanmaster,pikemanmaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(lesser_prophet_of_the_light_side, "lesser_prophet_of_the_light_side")
