taanab_destroy_missions = {
	minLevelCeiling = 50,

	lairSpawns = {
		{
			lairTemplateName = "talus_crazed_roba_lair_neutral_large",
			minDifficulty = 15,
			maxDifficulty = 24,
			size = 25,
		},
		{
			lairTemplateName = "taanab_norulac_raider_camp",
			minDifficulty = 54,
			maxDifficulty = 84,
			size = 25,
		},
		{
			lairTemplateName = "taanab_nerf_grassland_lair",
			minDifficulty = 28,
			maxDifficulty = 38,
			size = 25,
		},
		{
			lairTemplateName = "taanab_ambrian_staga_lair",
			minDifficulty = 12,
			maxDifficulty = 19,
			size = 25,
		},
		{
			lairTemplateName = "tatooine_feral_bantha_lair_neutral_large",
			minDifficulty = 15,
			maxDifficulty = 19,
			size = 25,
		},
	}
}

addDestroyMissionGroup("taanab_destroy_missions", taanab_destroy_missions);
