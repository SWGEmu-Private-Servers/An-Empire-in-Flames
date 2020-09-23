skill_buffs = {
	description = "",
	minimumLevel = 0,
	maximumLevel = 0,
	lootItems = {
		{itemTemplate = "skill_buff_heavy_weapon_accuracy", weight = 833333},
		{itemTemplate = "skill_buff_heavy_weapon_speed", weight = 833333},
		{itemTemplate = "skill_buff_melee_accuracy", weight = 833334},
		{itemTemplate = "skill_buff_melee_defense", weight = 833334},
		{itemTemplate = "skill_buff_pistol_accuracy", weight = 833333},
		{itemTemplate = "skill_buff_pistol_speed", weight = 833333},
		{itemTemplate = "skill_buff_ranged_accuracy", weight = 833334},
		{itemTemplate = "skill_buff_ranged_defense", weight = 833334},
		{itemTemplate = "skill_buff_rifle_accuracy", weight = 833333},
		{itemTemplate = "skill_buff_rifle_speed", weight = 833333},		
		{itemTemplate = "skill_buff_thrown_accuracy", weight = 833333},
		{itemTemplate = "skill_buff_thrown_speed", weight = 833333}				
	}
}

addLootGroupTemplate("skill_buffs", skill_buffs)