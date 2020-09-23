--EiF


object_draft_schematic_clothing_clothing_armor_bounty_hunter_belt = object_draft_schematic_clothing_shared_clothing_armor_bounty_hunter_belt:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Bounty Hunter Belt",

   craftingToolTab = 2, -- (See DraftSchematicObjectTemplate.h)
   complexity = 25, 
   size = 4, 
   factoryCrateSize = 0,

   xpType = "crafting_clothing_armor", 
   xp = 650, 

   assemblySkill = "armor_assembly", 
   experimentingSkill = "armor_experimentation", 
   customizationSkill = "armor_customization", 

   customizationOptions = {34, 2},
   customizationStringNames = {"/private/index_color_1", "/private/index_color_2"},
   customizationDefaults = {0, 0},

   ingredientTemplateNames = {"craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n"},
   ingredientTitleNames = {"auxilary_coverage", "body", "liner", "hardware_and_attachments", "binding_and_reinforcement", "padding", "load_bearing_harness", "reinforcement"},
   ingredientSlotType = {0, 0, 0, 0, 0, 0, 1, 1},
   resourceTypes = {"iron", "steel", "hide_leathery", "steel_neutronium", "petrochem_inert_polymer", "hide_wooly", "object/tangible/component/clothing/shared_fiberplast_panel.iff", "object/tangible/component/clothing/shared_reinforced_fiber_panels.iff"},
   resourceQuantities = {5, 5, 5, 5, 5, 5, 1, 1},
   contribution = {100, 100, 100, 100, 100, 100, 100, 100},


   targetTemplate = "object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_belt.iff",

   additionalTemplates = {
             }

}

ObjectTemplates:addTemplate(object_draft_schematic_clothing_clothing_armor_bounty_hunter_belt, "object/draft_schematic/clothing/clothing_armor_bounty_hunter_belt.iff")
