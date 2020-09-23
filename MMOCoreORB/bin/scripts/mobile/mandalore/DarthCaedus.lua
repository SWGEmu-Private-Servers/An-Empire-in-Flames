darth_caedus = Creature:new {
	objectName = "",
	customName = "Darth Caedus",
	socialGroup = "sith_shadow",
	pvpFaction = "sith_shadow",
	faction = "sith_shadow",
	level = 225,
	chanceHit = 4.750000,
	damageMin = 2445,
	damageMax = 4200,
	baseXp = 13273,
	baseHAM = 950000,
	baseHAMmax = 1750000,
	armor = 2,
	resists = {80,80,80,80,80,80,80,80,60},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_fs_village_enemy_mellichae.iff"},
	lootGroups = {
		
	
		{
	        	groups = 
			{
				{group = "wearables_scarce", chance = 10000000},
			},
			lootChance = 6500000,
		},
		
--		{
--	        	groups = 
--			{
--				{group = "kaas_rare", chance = 10000000},
--			},
--			lootChance = 7500000,
--		},
		{
	        	groups = 
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 7500000,
		},
		{
	        	groups = 
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 7500000,
		},
		{
	        	groups = 
			{
				{group = "clothing_attachments", chance = 10000000},
			},
			lootChance = 7500000,
		},
--		{
--	        	groups = 
--			{
--				{group = "dev", chance = 10000000},
--			},
--			lootChance = 7500000,
--		},
	   	{
			groups = {
				{group = "wearables_scarce", chance = 10000000},
			},
			lootChance = 8500000,
		},
		{
			groups = {
				{group = "wearables_scarce", chance = 10000000},
			},
			lootChance = 8500000
		},
				
	},
	weapons = {"dark_jedi_weapons_gen2"},
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(darth_caedus, "darth_caedus")
