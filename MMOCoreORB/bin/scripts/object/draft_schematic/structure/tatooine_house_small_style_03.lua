--Copyright (C) 2019 <EIF>


-- __________████████_____██████
-- _________█░░░░░░░░██_██░░░░░░█
-- ________█░░░░░░░░░░░█░░░░░░░░░█
-- _______█░░░░░░░███░░░█░░░░░░░░░█
-- _______█░░░░███░░░███░█░░░████░█
-- ______█░░░██░░░░░░░░███░██░░░░██
-- _____█░░░░░░░░░░░░░░░░░█░░░░░░░░███
-- ____█░░░░░░░░░░░░░██████░░░░░████░░█
-- ____█░░░░░░░░░█████░░░████░░██░░██░░█
-- ___██░░░░░░░███░░░░░░░░░░█░░░░░░░░███
-- __█░░░░░░░░░░░░░░█████████░░█████████
-- _█░░░░░░░░░░█████_████___████_█████___█
-- _█░░░░░░░░░░█__  █_███__█_____███_█___█
-- █░░░░░░░░░░░░█__   █_████____██_██████
-- ░░░░░░░░░░░░░█████████░░░████████░░░█
-- ░░░░░░░░░░░░░░░░█░░░░░█░░░░░░░░░░░░█
-- ░░░░░░░░░░░░░░░░░░░░██░░░░█░░░░░░██ 
-- ░░░░░░░░░░░░░░░░░░██░░░░░░░███████
-- ░░░░░░░░░░░░░░░░██░░░░░░░░░░█░░░░░█
-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
-- ░░░░░░░░░░░█████████░░░░░░░░░░░░░░██
-- ░░░░░░░░░░█▒▒▒▒▒▒▒▒███████████████▒▒█
-- ░░░░░░░░░█▒▒███████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█
-- ░░░░░░░░░█▒▒▒▒▒▒▒▒▒█████████████████
-- ░░░░░░░░░░████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█
-- ░░░░░░░░░░░░░░░░░░██████████████████
-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
-- ██░░░░░░░░░░░░░░░░░░░░░░░░░░░██
-- ▓██░░░░░░░░░░░░░░░░░░░░░░░░██
-- ▓▓▓███░░░░░░░░░░░░░░░░░░░░█
-- ▓▓▓▓▓▓███░░░░░░░░░░░░░░░██
-- ▓▓▓▓▓▓▓▓▓███████████████▓▓█
-- ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██
-- ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█
-- ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█

object_draft_schematic_structure_tatooine_house_small_style_03 = object_draft_schematic_structure_shared_tatooine_house_small_style_03:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Deed for: Small Tatooine House, Style 3",

	craftingToolTab = 1024, -- (See DraftSchematicObjectTemplate.h)
	complexity = 14,
	size = 10,
	factoryCrateSize = 1,

	xpType = "crafting_structure_general",
	xp = 1000,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n"},
	ingredientTitleNames = {"load_bearing_structure_and_shell", "insulation_and_covering", "foundation", "wall_sections", "power_supply_unit", "storage_space"},
	ingredientSlotType = {0, 0, 0, 2, 1, 1},
	resourceTypes = {"metal", "ore", "ore", "object/tangible/component/structure/shared_structural_module.iff", "object/tangible/component/structure/shared_light_power_core_unit.iff", "object/tangible/component/structure/shared_structure_small_storage_section.iff"},
	resourceQuantities = {100, 200, 200, 10, 1, 1},
	contribution = {100, 100, 100, 100, 100, 100},

	targetTemplate = "object/tangible/deed/player_house_deed/tatooine_house_small_style_03_deed.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_structure_tatooine_house_small_style_03, "object/draft_schematic/structure/tatooine_house_small_style_03.iff")
