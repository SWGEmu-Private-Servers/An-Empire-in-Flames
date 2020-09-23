function createInformantNPC(lvl)
	informant_npc = Creature:new {
		objectName = "@mob/creature_names:spynet_operative",
		socialGroup = "",
		faction = "",
		level = 100,
		chanceHit = 0.39,
		damageMin = 290,
		damageMax = 300,
		baseXp = 2914,
		baseHAM = 8400,
		baseHAMmax = 10200,
		armor = 0,
		resists = {-1,-1,-1,-1,-1,-1,-1,-1,-1},
		meatType = "",
		meatAmount = 0,
		hideType = "",
		hideAmount = 0,
		boneType = "",
		boneAmount = 0,
		milk = 0,
		tamingChance = 0,
		ferocity = 0,
		pvpBitmask = NONE,
		creatureBitmask = NONE,
		optionsBitmask = INVULNERABLE + CONVERSABLE,
		diet = HERBIVORE,
	
		templates = {
			"object/mobile/dressed_hutt_informant_quest.iff",
			"object/mobile/dressed_chadra_fan_f_01.iff",
			"object/mobile/dressed_chadra_fan_m_01.iff",
			"object/mobile/4lom.iff",
			"object/mobile/ev_9d9.iff",
			"object/mobile/ra7_bug_droid.iff",
			"object/mobile/3po_protocol_droid_red.iff",
			"object/mobile/3po_protocol_droid_silver.iff",
			"object/mobile/dressed_bestine_capitol04.iff",
			"object/mobile/dressed_bestine_artist05.iff",
			"object/mobile/dressed_bth_spynet_pilot_f_01.iff",
			"object/mobile/dressed_bth_spynet_pilot_m_01.iff",
			"object/mobile/dressed_bth_spynet_pilot_m_02.iff",
			"object/mobile/dressed_bth_spynet_pilot_m_03.iff",
			"object/mobile/dressed_gran_thug_male_01.iff",
			"object/mobile/dressed_gran_thug_male_02.iff",
		},
		lootGroups = {},
		weapons = {},
		conversationTemplate = "informant_npc_lvl_" .. lvl,
		attacks = {
		}
	}
	
	CreatureTemplates:addCreatureTemplate(informant_npc, "informant_npc_lvl_" .. lvl)
end

createInformantNPC("1")
createInformantNPC("2")
createInformantNPC("3")
