--EiF heavvy weapons crafting revamp
--2017

object_draft_schematic_weapon_heavy_lightning_beam = object_draft_schematic_weapon_shared_heavy_lightning_beam:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Lightning Beam Cannon",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 50, 
   size = 1, 

   xpType = "crafting_weapons_general", 
   xp = 550, 

   assemblySkill = "weapon_assembly", 
   experimentingSkill = "weapon_experimentation", 
   customizationSkill = "weapon_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n"},
   ingredientTitleNames = {"frame_assembly", "receiver_assembly", "grip_assembly", "enhanced_cooling_mechanism", "barrel", "core", "trigger"},
   ingredientSlotType = {0, 0, 0, 0, 1, 1, 1},
   resourceTypes = {"steel", "iron", "metal", "gemstone_crystalline", "object/tangible/component/munition/shared_capacitor_emitter.iff", "object/tangible/component/munition/shared_capacitor_base.iff", "object/tangible/component/munition/shared_heavy_trigger_base.iff"},
   resourceQuantities = {150, 40, 20, 45, 1, 1, 1},
   contribution = {100, 100, 100, 100, 100, 100, 100},


   targetTemplate = "object/weapon/ranged/heavy/heavy_lightning_beam.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_heavy_lightning_beam, "object/draft_schematic/weapon/heavy_lightning_beam.iff")
