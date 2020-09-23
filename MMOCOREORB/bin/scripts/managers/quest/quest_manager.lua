local ObjectManager = require("managers.object.object_manager")

local QuestManager = {}

local QUEST_ACTIVE = 1
local QUEST_COMPLETED = 1

-- Activate the quest for the player.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to activate.
function QuestManager.activateQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	if (QuestManager.shouldSendSystemMessage(pCreatureObject, quest)) then
		local summary = QuestManager.getJournalSummary(quest)

		if (summary ~= "") then
			CreatureObject(pCreatureObject):sendSystemMessage(" \\#FFFF33\\Quest Started:")
			CreatureObject(pCreatureObject):sendSystemMessage(summary)
		end

		CreatureObject(pCreatureObject):sendSystemMessage("@quest/quests:quest_journal_updated")
	end

	PlayerObject(pGhost):setActiveQuestsBit(quest, QUEST_ACTIVE)
end

function QuestManager.activateQuestSilent(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	PlayerObject(pGhost):setActiveQuestsBit(quest, QUEST_ACTIVE)
end

-- Checks if the player has a quest active.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to check if it is active.
function QuestManager.hasActiveQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):hasActiveQuestBitSet(quest)
end

-- Complete the quest for the player.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to complete.
function QuestManager.completeQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	if (QuestManager.shouldSendSystemMessage(pCreatureObject, quest)) then
		local summary = QuestManager.getJournalSummary(quest)

		if (summary ~= "") then
			CreatureObject(pCreatureObject):sendSystemMessage(" \\#FFFF33\\Quest Completed:")
			CreatureObject(pCreatureObject):sendSystemMessage(summary)
		end
	end

	PlayerObject(pGhost):clearActiveQuestsBit(quest)
	PlayerObject(pGhost):setCompletedQuestsBit(quest, QUEST_COMPLETED)
end


function QuestManager.completeQuestSilent(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	PlayerObject(pGhost):clearActiveQuestsBit(quest)
	PlayerObject(pGhost):setCompletedQuestsBit(quest, QUEST_COMPLETED)
end

-- Un-Complete the quest for the player and set quest active again.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to complete.
function QuestManager.uncompleteQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	PlayerObject(pGhost):clearCompletedQuestsBit(quest)
	PlayerObject(pGhost):setActiveQuestsBit(quest, QUEST_ACTIVE)
end

-- Checks if the player has a quest completed.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to check if it is completed.
function QuestManager.hasCompletedQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):hasCompletedQuestsBitSet(quest)
end

-- Reset the quest for the player.
-- @param pCreatureObject pointer to the creature object of the player.
-- @param quest the index number for the quest to reset.
function QuestManager.resetQuest(pCreatureObject, quest)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	PlayerObject(pGhost):clearActiveQuestsBit(quest)
	PlayerObject(pGhost):clearCompletedQuestsBit(quest)
end

function QuestManager.failQuest(pCreatureObject, quest)
	if (QuestManager.shouldSendSystemMessage(pCreatureObject, quest)) then
		CreatureObject(pCreatureObject):sendSystemMessage("@quest/quests:task_failure")
	end

	QuestManager.resetQuest(pCreatureObject, quest)
end

function QuestManager.shouldSendSystemMessage(pCreatureObject, quest)
	local pQuest = getQuestInfo(quest)

	if (pQuest == nil) then
		return false
	end

	return LuaQuestInfo(pQuest):shouldSendSystemMessage()
end

function QuestManager.getQuestName(questID)
	local pQuest = getQuestInfo(questID)

	if (pQuest == nil) then
		return ""
	end

	return LuaQuestInfo(pQuest):getQuestName()
end

function QuestManager.getJournalSummary(questID)
	local pQuest = getQuestInfo(questID)

	if (pQuest == nil) then
		return ""
	end

	return LuaQuestInfo(pQuest):getJournalSummary()
end

function QuestManager.getCurrentQuestID(pPlayer)
	local id = tonumber(readScreenPlayData(pPlayer, "VillageJediProgression", "CurrentQuestID"))

	if (id == nil) then
		id = -1
	end

	return id
end

function QuestManager.setCurrentQuestID(pPlayer, qid)
	return writeScreenPlayData(pPlayer, "VillageJediProgression", "CurrentQuestID", qid)
end

function QuestManager.getStoredVillageValue(pPlayer, key)
	return readScreenPlayData(pPlayer, "VillageJediProgression", key)
end

function QuestManager.setStoredVillageValue(pPlayer, key, value)
	return writeScreenPlayData(pPlayer, "VillageJediProgression", key, value)
end

QuestManager.quests = {}

QuestManager.quests.TEST_SIMPLE 					= 0
QuestManager.quests.TEST_GOTO_01 					= 1
QuestManager.quests.TEST_GOTO_02 					= 2
QuestManager.quests.TEST_GOTO_03 					= 3
QuestManager.quests.TEST_FIND_01 					= 4
QuestManager.quests.TEST_ENCOUNTER_01 				= 5
QuestManager.quests.TEST_DESTROY_01 				= 6
QuestManager.quests.TEST_ESCORT_01 					= 7
QuestManager.quests.TEST_ESCORT_LOCATION 			= 8
QuestManager.quests.TEST_RANDOM 					= 9
QuestManager.quests.TEST_GIVE 						= 10
QuestManager.quests.SCT1 							= 11
QuestManager.quests.SCT2 							= 12
QuestManager.quests.SCT3 							= 13
QuestManager.quests.SCT4 							= 14
QuestManager.quests.FS_QUESTS_SAD_TASKS 			= 15
QuestManager.quests.FS_QUESTS_SAD_TASK1 			= 16
QuestManager.quests.FS_QUESTS_SAD_RETURN1 			= 17
QuestManager.quests.FS_QUESTS_SAD_TASK2 			= 18
QuestManager.quests.FS_QUESTS_SAD_RETURN2 			= 19
QuestManager.quests.FS_QUESTS_SAD_TASK3 			= 20
QuestManager.quests.FS_QUESTS_SAD_RETURN3 			= 21
QuestManager.quests.FS_QUESTS_SAD_TASK4 			= 22
QuestManager.quests.FS_QUESTS_SAD_RETURN4 			= 23
QuestManager.quests.FS_QUESTS_SAD_TASK5 			= 24
QuestManager.quests.FS_QUESTS_SAD_RETURN5 			= 25
QuestManager.quests.FS_QUESTS_SAD_TASK6 			= 26
QuestManager.quests.FS_QUESTS_SAD_RETURN6 			= 27
QuestManager.quests.FS_QUESTS_SAD_TASK7 			= 28
QuestManager.quests.FS_QUESTS_SAD_RETURN7 			= 29
QuestManager.quests.FS_QUESTS_SAD_TASK8 			= 30
QuestManager.quests.FS_QUESTS_SAD_RETURN8 			= 31
QuestManager.quests.FS_QUESTS_SAD_FINISH 			= 32
QuestManager.quests.FS_QUESTS_SAD2_TASKS 			= 33
QuestManager.quests.FS_QUESTS_SAD2_TASK1			= 34
QuestManager.quests.FS_QUESTS_SAD2_RETURN1 			= 35
QuestManager.quests.FS_QUESTS_SAD2_TASK2 			= 36
QuestManager.quests.FS_QUESTS_SAD2_RETURN2 			= 37
QuestManager.quests.FS_QUESTS_SAD2_TASK3 			= 38
QuestManager.quests.FS_QUESTS_SAD2_RETURN3 			= 39
QuestManager.quests.FS_QUESTS_SAD2_TASK4 			= 40
QuestManager.quests.FS_QUESTS_SAD2_RETURN4 			= 41
QuestManager.quests.FS_QUESTS_SAD2_TASK5 			= 42
QuestManager.quests.FS_QUESTS_SAD2_RETURN5 			= 43
QuestManager.quests.FS_QUESTS_SAD2_TASK6 			= 44
QuestManager.quests.FS_QUESTS_SAD2_RETURN6 			= 45
QuestManager.quests.FS_QUESTS_SAD2_TASK7 			= 46
QuestManager.quests.FS_QUESTS_SAD2_RETURN7 			= 47
QuestManager.quests.FS_QUESTS_SAD2_TASK8 			= 48
QuestManager.quests.FS_QUESTS_SAD2_RETURN8 			= 49
QuestManager.quests.FS_QUESTS_SAD2_FINISH 			= 50
QuestManager.quests.FS_MEDIC_PUZZLE_QUEST_01 		= 51
QuestManager.quests.FS_MEDIC_PUZZLE_QUEST_02 		= 52
QuestManager.quests.FS_MEDIC_PUZZLE_QUEST_03 		= 53
QuestManager.quests.FS_PHASE_2_CRAFT_DEFENSES_02 	= 54
QuestManager.quests.FS_PHASE_3_CRAFT_SHIELDS_02 	= 55
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_00 		= 56
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_01 		= 57
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_02 		= 58
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_03 		= 59
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_04 		= 60
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_05 		= 61
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_06 		= 62
QuestManager.quests.FS_REFLEX_FETCH_QUEST_00 		= 63
QuestManager.quests.FS_REFLEX_FETCH_QUEST_01 		= 64
QuestManager.quests.FS_REFLEX_FETCH_QUEST_02 		= 65
QuestManager.quests.FS_REFLEX_FETCH_QUEST_03 		= 66
QuestManager.quests.FS_REFLEX_FETCH_QUEST_04 		= 67
QuestManager.quests.FS_REFLEX_FETCH_QUEST_05 		= 68
QuestManager.quests.FS_REFLEX_FETCH_QUEST_06 		= 69
QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_00 		= 70
QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_01 		= 71
QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_02 		= 72
QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_03 		= 73
QuestManager.quests.OLD_MAN_INITIAL 				= 74
QuestManager.quests.FS_THEATER_CAMP 				= 75
QuestManager.quests.DO_NOT_USE_BAD_SLOT 			= 76
QuestManager.quests.FS_GOTO_DATH 					= 77
QuestManager.quests.FS_VILLAGE_ELDER 				= 78
QuestManager.quests.OLD_MAN_FORCE_CRYSTAL 			= 79
QuestManager.quests.FS_DATH_WOMAN 					= 80
QuestManager.quests.FS_PATROL_QUEST_1 				= 81
QuestManager.quests.FS_PATROL_QUEST_2 				= 82
QuestManager.quests.FS_PATROL_QUEST_3 				= 83
QuestManager.quests.FS_PATROL_QUEST_4 				= 84
QuestManager.quests.FS_PATROL_QUEST_5 				= 85
QuestManager.quests.FS_PATROL_QUEST_6 				= 86
QuestManager.quests.FS_PATROL_QUEST_7 				= 87
QuestManager.quests.FS_PATROL_QUEST_8 				= 88
QuestManager.quests.FS_PATROL_QUEST_9 				= 89
QuestManager.quests.FS_PATROL_QUEST_10 				= 90
QuestManager.quests.FS_PATROL_QUEST_11 				= 91
QuestManager.quests.FS_PATROL_QUEST_12 				= 92
QuestManager.quests.FS_PATROL_QUEST_13 				= 93
QuestManager.quests.FS_PATROL_QUEST_14 				= 94
QuestManager.quests.FS_PATROL_QUEST_15 				= 95
QuestManager.quests.FS_PATROL_QUEST_16 				= 96
QuestManager.quests.FS_PATROL_QUEST_17 				= 97
QuestManager.quests.FS_PATROL_QUEST_18 				= 98
QuestManager.quests.FS_PATROL_QUEST_19 				= 99
QuestManager.quests.FS_PATROL_QUEST_20 				= 100
QuestManager.quests.FS_COMBAT_HEALING_1 			= 101
QuestManager.quests.FS_COMBAT_HEALING_2 			= 102
QuestManager.quests.FS_DEFEND_SET_FACTION 			= 103
QuestManager.quests.FS_DEFEND_01 					= 104
QuestManager.quests.FS_DEFEND_02 					= 105
QuestManager.quests.FS_DEFEND_REwARD_01 			= 106
QuestManager.quests.FS_DEFEND_03 					= 107
QuestManager.quests.FS_DEFEND_04 					= 108
QuestManager.quests.FS_CS_INTRO 					= 109
QuestManager.quests.FS_CS_KILL5_GUARDS 				= 110
QuestManager.quests.FS_CS_ENSURE_CAPTURE 			= 111
QuestManager.quests.FS_CS_LAST_CHANCE 				= 112
QuestManager.quests.FS_CS_ESCORT_COMMANDER_PRI 		= 113
QuestManager.quests.FS_CS_ESCORT_COMMANDER_SEC 		= 114
QuestManager.quests.FS_CS_QUEST_DONE 				= 115
QuestManager.quests.FS_THEATER_FINAL 				= 116
QuestManager.quests.OLD_MAN_FINAL 					= 117
QuestManager.quests.FS_CRAFTING4_QUEST_00 			= 118
QuestManager.quests.FS_CRAFTING4_QUEST_01 			= 119
QuestManager.quests.FS_CRAFTING4_QUEST_02 			= 120
QuestManager.quests.FS_CRAFTING4_QUEST_03 			= 121
QuestManager.quests.FS_CRAFTING4_QUEST_04 			= 122
QuestManager.quests.FS_CRAFTING4_QUEST_05 			= 123
QuestManager.quests.FS_CRAFTING4_QUEST_06 			= 124
QuestManager.quests.FS_CRAFTING4_QUEST_07 			= 125
QuestManager.quests.TWO_MILITARY 					= 126
QuestManager.quests.FS_DEFEND_REwARD_02 			= 127
QuestManager.quests.FS_DEFEND_REwARD_03 			= 128
QuestManager.quests.SURVEY_PHASE2_MAIN 				= 129
QuestManager.quests.SURVEY_PHASE2_01 				= 130
QuestManager.quests.SURVEY_PHASE2_02 				= 131
QuestManager.quests.SURVEY_PHASE2_03 				= 132
QuestManager.quests.SURVEY_PHASE2_04 				= 133
QuestManager.quests.SURVEY_PHASE2_05 				= 134
QuestManager.quests.SURVEY_PHASE2_06 				= 135
QuestManager.quests.SURVEY_PHASE2_07 				= 136
QuestManager.quests.SURVEY_PHASE2_08 				= 137
QuestManager.quests.SURVEY_PHASE3_MAIN 				= 138
QuestManager.quests.SURVEY_PHASE3_01 				= 139
QuestManager.quests.SURVEY_PHASE3_02 				= 140
QuestManager.quests.SURVEY_PHASE3_03 				= 141
QuestManager.quests.SURVEY_PHASE3_04 				= 142
QuestManager.quests.SURVEY_PHASE3_05 				= 143
QuestManager.quests.SURVEY_PHASE3_06 				= 144
QuestManager.quests.SURVEY_PHASE3_07 				= 145
QuestManager.quests.SURVEY_PHASE3_08 				= 146
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_01 	= 147
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_02 	= 148
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_03 	= 149
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_04 	= 150
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_05 	= 151
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_06 	= 152
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_07 	= 153
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_08 	= 154
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_09 	= 155
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_10 	= 156
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_11 	= 157
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_12 	= 158
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_13 	= 159
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_14 	= 160
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_15 	= 161
QuestManager.quests.FS_SURVEY_SPECIAL_RESOURCE_16 	= 162
QuestManager.quests.FS_DATH_wOMAN_TALK 			= 163
QuestManager.quests.FS_PATROL_QUEST_START 		= 164
QuestManager.quests.FS_REFLEX_RESCUE_QUEST_07 		= 165
QuestManager.quests.FS_SURVEY_PHASE2_REwARD 		= 166
QuestManager.quests.FS_SURVEY_PHASE3_REwARD 		= 167
QuestManager.quests.FS_DEFEND_SET_FACTION_02 		= 168
QuestManager.quests.LOOT_DATAPAD_1 			= 169
QuestManager.quests.GOT_DATAPAD 			= 170
QuestManager.quests.FS_PHASE_2_CRAFT_DEFENSES_01 	= 171
QuestManager.quests.FS_PHASE_3_CRAFT_SHIELDS_01 	= 172
QuestManager.quests.FS_PHASE_2_CRAFT_DEFENSES_MAIN 	= 173
QuestManager.quests.FS_PHASE_3_CRAFT_SHIELDS_MAIN 	= 174
QuestManager.quests.LOOT_DATAPAD_2 			= 175
QuestManager.quests.GOT_DATAPAD_2 			= 176
QuestManager.quests.FS_CS_QUEST_FAILED_ESCORT 		= 177
QuestManager.quests.FS_PATROL_QUEST_FINISH 		= 178
QuestManager.quests.FS_MEDIC_PUZZLE_QUEST_FINISH 	= 179
QuestManager.quests.FS_COMBAT_HEALING_FINISH 		= 180
QuestManager.quests.FS_COMBAT_REWARD_PHASE2 		= 181
QuestManager.quests.FS_REFLEX_REWARD_PHASE3 		= 182
QuestManager.quests.FS_DEFEND_WAIT_01 			= 183
QuestManager.quests.FS_DEFEND_WAIT_02 			= 184
QuestManager.quests.FS_CRAFTING4_QUEST_FINISH 		= 185
QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_04 		= 186
QuestManager.quests.FS_CS_QUEST_DONE_NOTIFYONLY 	= 187
QuestManager.quests.HEROIC_SHRINE		 	= 188
QuestManager.quests.HEROIC_SHRINE_BOSS_01	 	= 189
QuestManager.quests.HEROIC_SHRINE_BOSS_02	 	= 190
QuestManager.quests.HEROIC_SHRINE_BOSS_03	 	= 191
QuestManager.quests.HEROIC_SHRINE_BOSS_04	 	= 192
QuestManager.quests.HEROIC_SHRINE_BOSS_05	 	= 193
QuestManager.quests.HEROIC_SHRINE_BOSS_06	 	= 194
QuestManager.quests.HEROIC_AXKVA_MIN		 	= 195
QuestManager.quests.HEROIC_AXKVA_MIN_REBEL	 	= 196
QuestManager.quests.HEROIC_AXKVA_MIN_IMPERIAL	 	= 197
QuestManager.quests.HEROIC_AXKVA_MIN_NEUTRAL	 	= 198
QuestManager.quests.HEROIC_AXKVA_MIN_01		 	= 199
QuestManager.quests.HEROIC_AXKVA_MIN_02		 	= 200
QuestManager.quests.HEROIC_AXKVA_MIN_03		 	= 201
QuestManager.quests.HEROIC_AXKVA_MIN_04		 	= 202
QuestManager.quests.HEROIC_AXKVA_MIN_05		 	= 203
QuestManager.quests.HEROIC_PLASMA		 	= 204
QuestManager.quests.HEROIC_PLASMA_SORUNA	 	= 205
QuestManager.quests.HEROIC_PLASMA_KYLANTHA	 	= 206
QuestManager.quests.HEROIC_PLASMA_01		 	= 207
QuestManager.quests.HEROIC_PLASMA_02		 	= 208
QuestManager.quests.HEROIC_PLASMA_03		 	= 209
QuestManager.quests.HEROIC_PLASMA_04		 	= 210
QuestManager.quests.HEROIC_PLASMA_05		 	= 211
QuestManager.quests.GALAXY_TOUR			 	= 212
QuestManager.quests.GALAXY_TOUR_KUAT		 	= 213
QuestManager.quests.GALAXY_TOUR_MONCAL		 	= 214
QuestManager.quests.GALAXY_TOUR_CORUSCANT	 	= 215
QuestManager.quests.GALAXY_TOUR_CHANDRILA	 	= 216
QuestManager.quests.GALAXY_TOUR_TALUS		 	= 217
QuestManager.quests.GALAXY_TOUR_TAANAB		 	= 218
QuestManager.quests.GALAXY_TOUR_NABOO		 	= 219
QuestManager.quests.GALAXY_TOUR_RORI		 	= 220
QuestManager.quests.GALAXY_TOUR_ENDOR		 	= 221
QuestManager.quests.GALAXY_TOUR_HOTH		 	= 222
QuestManager.quests.GALAXY_TOUR_LOK		 	= 223
QuestManager.quests.GALAXY_TOUR_TATOOINE	 	= 224
QuestManager.quests.GALAXY_TOUR_DANTOOINE	 	= 225
QuestManager.quests.GALAXY_TOUR_DATHOMIR	 	= 226
QuestManager.quests.GALAXY_TOUR_YAVIN4		 	= 227
QuestManager.quests.COLLECTIONS_RESTUSS_DEBRIS		= 228
QuestManager.quests.COLLECTIONS_RESTUSS_DEBRIS_01	= 229
QuestManager.quests.COLLECTIONS_RESTUSS_DEBRIS_02	= 230
QuestManager.quests.COLLECTIONS_RESTUSS_DEBRIS_03	= 231
QuestManager.quests.COLLECTIONS_RESTUSS_DEBRIS_04	= 232
QuestManager.quests.COLLECTIONS_RESTUSS_DEBRIS_05	= 233
QuestManager.quests.COLLECTIONS_RESTUSS_DEBRIS_06	= 234
QuestManager.quests.COLLECTIONS_RESTUSS_DEBRIS_07	= 235
QuestManager.quests.COLLECTIONS_RESTUSS_DEBRIS_08	= 236
QuestManager.quests.SPEEDER_FOR_ME			= 237
QuestManager.quests.SPEEDER_FOR_ME_01			= 238
QuestManager.quests.SPEEDER_FOR_ME_02			= 239
QuestManager.quests.SPEEDER_FOR_ME_03			= 240
QuestManager.quests.RESTUSS_OVERQUEST			= 241
QuestManager.quests.RESTUSS_CALL_HONDO			= 242
QuestManager.quests.RESTUSS_MAYOR			= 243
QuestManager.quests.RESTUSS_MAYOR_GOAL			= 244
QuestManager.quests.RESTUSS_UNIVERSITY_GOAL		= 245
QuestManager.quests.RESTUSS_MERCHANT_GOAL		= 246
QuestManager.quests.RESTUSS_TRAINER_GOAL		= 247
QuestManager.quests.RESTUSS_CANTINA_GOAL		= 248
QuestManager.quests.RESTUSS_HOSPITAL_GOAL		= 249
QuestManager.quests.COLLECTIONS_HOTH_TAUNTAUN		= 250
QuestManager.quests.COLLECTIONS_HOTH_TAUNTAUN_01	= 251
QuestManager.quests.COLLECTIONS_HOTH_TAUNTAUN_02	= 252
QuestManager.quests.COLLECTIONS_HOTH_TAUNTAUN_03	= 253
QuestManager.quests.COLLECTIONS_HOTH_TAUNTAUN_04	= 254
QuestManager.quests.COLLECTIONS_HOTH_TAUNTAUN_05	= 255
QuestManager.quests.COLLECTIONS_HOTH_TAUNTAUN_06	= 256
QuestManager.quests.COLLECTIONS_HOTH_TAUNTAUN_07	= 257
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK		= 258
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK_01	= 259
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK_02	= 260
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK_03	= 261
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK_04	= 262
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK_05	= 263
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK_06	= 264
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK_07	= 265
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK_08	= 266
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK_09	= 267
QuestManager.quests.COLLECTIONS_BUBBLING_ROCK_10	= 268
QuestManager.quests.COLLECTIONS_MIGHT_EMPIRE		= 269
QuestManager.quests.COLLECTIONS_MIGHT_EMPIRE_01		= 270
QuestManager.quests.COLLECTIONS_MIGHT_EMPIRE_02		= 271
QuestManager.quests.COLLECTIONS_MIGHT_EMPIRE_03		= 272
QuestManager.quests.COLLECTIONS_MIGHT_EMPIRE_04		= 273
QuestManager.quests.COLLECTIONS_MIGHT_EMPIRE_05		= 274
QuestManager.quests.COLLECTIONS_MIGHT_EMPIRE_06		= 275
QuestManager.quests.COLLECTIONS_MIGHT_EMPIRE_07		= 276
QuestManager.quests.COLLECTIONS_MIGHT_EMPIRE_08		= 277
QuestManager.quests.COLLECTIONS_MIGHT_EMPIRE_09		= 278
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION	= 279
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION_01	= 280
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION_02	= 281
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION_03	= 282
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION_04	= 283
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION_05	= 284
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION_06	= 285
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION_07	= 286
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION_08	= 287
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION_09	= 288
QuestManager.quests.COLLECTIONS_WILL_OF_REBELLION_10	= 289
QuestManager.quests.COLLECTIONS_BURNING_ROCK		= 290
QuestManager.quests.COLLECTIONS_BURNING_ROCK_01		= 291
QuestManager.quests.COLLECTIONS_BURNING_ROCK_02		= 292
QuestManager.quests.COLLECTIONS_BURNING_ROCK_03		= 293
QuestManager.quests.COLLECTIONS_BURNING_ROCK_04		= 294
QuestManager.quests.COLLECTIONS_BURNING_ROCK_05		= 295
QuestManager.quests.COLLECTIONS_BURNING_ROCK_06		= 296
QuestManager.quests.COLLECTIONS_BURNING_ROCK_07		= 297
QuestManager.quests.COLLECTIONS_BURNING_ROCK_08		= 298
QuestManager.quests.COLLECTIONS_BURNING_ROCK_09		= 299
QuestManager.quests.COLLECTIONS_BURNING_ROCK_10		= 300
QuestManager.quests.COLLECTIONS_STEAMING_ROCK		= 301
QuestManager.quests.COLLECTIONS_STEAMING_ROCK_01	= 302
QuestManager.quests.COLLECTIONS_STEAMING_ROCK_02	= 303
QuestManager.quests.COLLECTIONS_STEAMING_ROCK_03	= 304
QuestManager.quests.COLLECTIONS_STEAMING_ROCK_04	= 305
QuestManager.quests.COLLECTIONS_STEAMING_ROCK_05	= 306
QuestManager.quests.COLLECTIONS_STEAMING_ROCK_06	= 307
QuestManager.quests.COLLECTIONS_STEAMING_ROCK_07	= 308
QuestManager.quests.COLLECTIONS_STEAMING_ROCK_08	= 309
QuestManager.quests.COLLECTIONS_STEAMING_ROCK_09	= 310
QuestManager.quests.COLLECTIONS_STEAMING_ROCK_10	= 311
QuestManager.quests.COLLECTIONS_GLOWING_ROCK		= 312
QuestManager.quests.COLLECTIONS_GLOWING_ROCK_01		= 313
QuestManager.quests.COLLECTIONS_GLOWING_ROCK_02		= 314
QuestManager.quests.COLLECTIONS_GLOWING_ROCK_03		= 315
QuestManager.quests.COLLECTIONS_GLOWING_ROCK_04		= 316
QuestManager.quests.COLLECTIONS_GLOWING_ROCK_05		= 317
QuestManager.quests.COLLECTIONS_GLOWING_ROCK_06		= 318
QuestManager.quests.COLLECTIONS_GLOWING_ROCK_07		= 319
QuestManager.quests.COLLECTIONS_GLOWING_ROCK_08		= 320
QuestManager.quests.COLLECTIONS_GLOWING_ROCK_09		= 321
QuestManager.quests.COLLECTIONS_GLOWING_ROCK_10		= 322
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR	= 323
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR_01	= 324
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR_02	= 325
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR_03	= 326
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR_04	= 327
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR_05	= 328
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR_06	= 329
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR_07	= 330
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR_08	= 331
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR_09	= 332
QuestManager.quests.COLLECTIONS_NR_ASSAULT_ARMOR_10	= 333
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR		= 334
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR_01	= 335
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR_02	= 336
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR_03	= 337
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR_04	= 338
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR_05	= 339
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR_06	= 340
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR_07	= 341
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR_08	= 342
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR_09	= 343
QuestManager.quests.COLLECTIONS_NR_MARINE_ARMOR_10	= 344
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR		= 345
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR_01	= 346
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR_02	= 347
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR_03	= 348
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR_04	= 349
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR_05	= 350
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR_06	= 351
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR_07	= 352
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR_08	= 353
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR_09	= 354
QuestManager.quests.COLLECTIONS_NR_BATTLE_ARMOR_10	= 355
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR	= 356
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR_01	= 357
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR_02	= 358
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR_03	= 359
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR_04	= 360
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR_05	= 361
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR_06	= 362
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR_07	= 363
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR_08	= 364
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR_09	= 365
QuestManager.quests.COLLECTIONS_SCOUT_TROOPER_ARMOR_10	= 366
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR	= 367
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR_01	= 368
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR_02	= 369
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR_03	= 370
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR_04	= 371
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR_05	= 372
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR_06	= 373
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR_07	= 374
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR_08	= 375
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR_09	= 376
QuestManager.quests.COLLECTIONS_SHOCK_TROOPER_ARMOR_10	= 377
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR	= 378
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR_01	= 379
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR_02	= 380
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR_03	= 381
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR_04	= 382
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR_05	= 383
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR_06	= 384
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR_07	= 385
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR_08	= 386
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR_09	= 387
QuestManager.quests.COLLECTIONS_STORMTROOPER_ARMOR_10	= 388
QuestManager.quests.COLLECTIONS_STUFFED_RANCOR		= 389
QuestManager.quests.COLLECTIONS_STUFFED_RANCOR_01	= 390
QuestManager.quests.COLLECTIONS_STUFFED_RANCOR_02	= 391
QuestManager.quests.COLLECTIONS_STUFFED_RANCOR_03	= 392
QuestManager.quests.COLLECTIONS_STUFFED_RANCOR_04	= 393
QuestManager.quests.COLLECTIONS_STUFFED_RANCOR_05	= 394
QuestManager.quests.COLLECTIONS_STUFFED_RANCOR_06	= 395
QuestManager.quests.COLLECTIONS_STUFFED_RANCOR_07	= 396
QuestManager.quests.COLLECTIONS_STUFFED_RANCOR_08	= 397
QuestManager.quests.EMPIRE_DAY_REBEL_PROPAGANDA		= 398
QuestManager.quests.EMPIRE_DAY_IMPERIAL_PROPAGANDA	= 399
QuestManager.quests.EMPIRE_DAY_REBEL_ANTIPROPAGANDA	= 400
QuestManager.quests.EMPIRE_DAY_IMPERIAL_ANTIPROPAGANDA	= 401
QuestManager.quests.EMPIRE_DAY_EWOK_DEFENSE		= 402
QuestManager.quests.EMPIRE_DAY_EWOK_ASSAULT		= 403
QuestManager.quests.EMPIRE_DAY_EWOK_REBEL_PVP		= 404
QuestManager.quests.EMPIRE_DAY_EWOK_IMPERIAL_PVP	= 405
QuestManager.quests.EMPIRE_DAY_REBEL_SPEEDERBIKE	= 406
QuestManager.quests.EMPIRE_DAY_IMPERIAL_SPEEDERBIKE	= 407
QuestManager.quests.COLLECTIONS_STUFFED_DEWBACK		= 408
QuestManager.quests.COLLECTIONS_STUFFED_DEWBACK_01	= 409
QuestManager.quests.COLLECTIONS_STUFFED_DEWBACK_02	= 410
QuestManager.quests.COLLECTIONS_STUFFED_DEWBACK_03	= 411
QuestManager.quests.COLLECTIONS_STUFFED_DEWBACK_04	= 412
QuestManager.quests.COLLECTIONS_STUFFED_DEWBACK_05	= 413
QuestManager.quests.COLLECTIONS_STUFFED_DEWBACK_06	= 414
QuestManager.quests.COLLECTIONS_STUFFED_DEWBACK_07	= 415
QuestManager.quests.COLLECTIONS_STUFFED_DEWBACK_08	= 416
QuestManager.quests.COLLECTIONS_STUFFED_TAUNTAUN	= 417
QuestManager.quests.COLLECTIONS_STUFFED_TAUNTAUN_01	= 418
QuestManager.quests.COLLECTIONS_STUFFED_TAUNTAUN_02	= 419
QuestManager.quests.COLLECTIONS_STUFFED_TAUNTAUN_03	= 420
QuestManager.quests.COLLECTIONS_STUFFED_TAUNTAUN_04	= 421
QuestManager.quests.COLLECTIONS_STUFFED_TAUNTAUN_05	= 422
QuestManager.quests.COLLECTIONS_STUFFED_TAUNTAUN_06	= 423
QuestManager.quests.COLLECTIONS_STUFFED_TAUNTAUN_07	= 424
QuestManager.quests.COLLECTIONS_STUFFED_TAUNTAUN_08	= 425
QuestManager.quests.COLLECTIONS_STUFFED_WAMPA		= 426
QuestManager.quests.COLLECTIONS_STUFFED_WAMPA_01	= 427
QuestManager.quests.COLLECTIONS_STUFFED_WAMPA_02	= 428
QuestManager.quests.COLLECTIONS_STUFFED_WAMPA_03	= 429
QuestManager.quests.COLLECTIONS_STUFFED_WAMPA_04	= 430
QuestManager.quests.COLLECTIONS_STUFFED_WAMPA_05	= 431
QuestManager.quests.COLLECTIONS_STUFFED_WAMPA_06	= 432
QuestManager.quests.COLLECTIONS_STUFFED_WAMPA_07	= 433
QuestManager.quests.COLLECTIONS_STUFFED_WAMPA_08	= 434
QuestManager.quests.COLLECTIONS_STUFFED_WAMPA_09	= 435
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION	= 436
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_01	= 437
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_02	= 438
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_03	= 439
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_04	= 440
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_05	= 441
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_06	= 442
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_07	= 443
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_08	= 444
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_09	= 445
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_10	= 446
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_11	= 447
QuestManager.quests.COLLECTIONS_DURNI_INFESTATION_12	= 448
QuestManager.quests.COLLECTIONS_GLASS_SHELVING		= 449
QuestManager.quests.COLLECTIONS_GLASS_SHELVING_01	= 450
QuestManager.quests.COLLECTIONS_GLASS_SHELVING_02	= 451
QuestManager.quests.COLLECTIONS_GLASS_SHELVING_03	= 452
QuestManager.quests.COLLECTIONS_GLASS_SHELVING_04	= 453
QuestManager.quests.COLLECTIONS_GLASS_SHELVING_05	= 454
QuestManager.quests.COLLECTIONS_GLASS_SHELVING_06	= 455
QuestManager.quests.COLLECTIONS_GLASS_SHELVING_07	= 456
QuestManager.quests.COLLECTIONS_GLASS_SHELVING_08	= 457
QuestManager.quests.COLLECTIONS_GLASS_SHELVING_09	= 458
QuestManager.quests.COLLECTIONS_GLASS_SHELVING_10	= 459
QuestManager.quests.COLLECTIONS_HOTH_METEORITE		= 460
QuestManager.quests.COLLECTIONS_HOTH_METEORITE_01	= 461
QuestManager.quests.COLLECTIONS_HOTH_METEORITE_02	= 462
QuestManager.quests.COLLECTIONS_HOTH_METEORITE_03	= 463
QuestManager.quests.COLLECTIONS_HOTH_METEORITE_04	= 464
QuestManager.quests.COLLECTIONS_HOTH_METEORITE_05	= 465
QuestManager.quests.COLLECTIONS_HOTH_METEORITE_06	= 466
QuestManager.quests.COLLECTIONS_HOTH_METEORITE_07	= 467
QuestManager.quests.COLLECTIONS_HOTH_METEORITE_08	= 468
QuestManager.quests.COLLECTIONS_HOTH_METEORITE_09	= 469
QuestManager.quests.COLLECTIONS_HOTH_METEORITE_10	= 470


return QuestManager
