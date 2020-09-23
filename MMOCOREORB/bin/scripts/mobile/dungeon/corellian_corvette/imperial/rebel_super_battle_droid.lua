rebel_super_battle_droid = Creature:new {
	objectName = "@mob/creature_names:rebel_super_battle_droid",
	socialGroup = "rebel",
	faction = "rebel",
	level = 200,
	chanceHit = 18,
	damageMin = 1015,
	damageMax = 1050,
	baseXp = 19000,
	baseHAM = 230000,
	baseHAMmax = 230000,
	armor = 2,
	resists = {50,50,70,55,55,45,70,45,50},--kinetic,energy,blast,heat,cold,electric,acid,stun,ls
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
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = NONE,
	scale = 1.40,

	templates = {
		"object/mobile/super_battle_droid.iff",
	},
	lootGroups = {
		{
			groups = {
				{group = "clothing_attachments", chance = 5000000},
				{group = "armor_attachments", chance = 5000000},
			},
			lootChance = 1000000,
		}
	},
	conversationTemplate = "",
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
  attacks = merge(rangedchallenger)
}

CreatureTemplates:addCreatureTemplate(rebel_super_battle_droid, "rebel_super_battle_droid")
