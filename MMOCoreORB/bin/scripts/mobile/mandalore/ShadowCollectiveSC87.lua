shadow_collective_sc87 = Creature:new {
	objectName = "",
	customName = "SC-87",	
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 225,
	chanceHit = 15,
	damageMin = 1200,
	damageMax = 2300,
	baseXp = 19000,
	baseHAM = 1500000,
	baseHAMmax = 1500000,
	armor = 2,
	resists = {85,95,100,60,100,25,40,85,-1},--kinetic,energy,blast,heat,cold,electric,acid,stun,ls
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
	optionsBitmask = 128,
	diet = NONE,

	templates = {"object/mobile/ig_88.iff"},
	scale = 1.5,
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 10000000}
			},
			lootChance = 500000
		}
	},
	conversationTemplate = "",
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(shadow_collective_sc87, "shadow_collective_sc87")
