corsec_battle_droid = Creature:new {
  objectName = "@mob/creature_names:rebel_battle_droid",
  socialGroup = "corsec",
  faction = "corsec",
  level = 134,
  chanceHit = 5.5,
  damageMin = 795,
  damageMax = 1300,
  baseXp = 12612,
  baseHAM = 56000,
  baseHAMmax = 68000,
  armor = 2,
	resists = {45,45,65,50,50,35,65,35,45},
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
  scale = 1.15,

  templates = {
    "object/mobile/battle_droid.iff"
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
  weapons = {"battle_droid_weapons"},
  attacks = merge(pistoleermaster,carbineermaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(corsec_battle_droid, "corsec_battle_droid")
