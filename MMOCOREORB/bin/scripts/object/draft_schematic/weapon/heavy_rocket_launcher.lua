--EiF heavvy weapons crafting revamp
--2017

object_draft_schematic_weapon_heavy_rocket_launcher = object_draft_schematic_weapon_shared_heavy_rocket_launcher:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Rocket Launcher",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 50, 
   size = 4, 

   xpType = "crafting_weapons_general", 
   xp = 550, 

   assemblySkill = "weapon_assembly", 
   experimentingSkill = "weapon_experimentation", 
   customizationSkill = "weapon_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_munition_ingredients_n", "craft_munition_ingredients_n", "craft_munition_ingredients_n", "craft_munition_ingredients_n"},
   ingredientTitleNames = {"frame_assembly", "receiver_assembly", "grip_assembly", "launch_tubes", "fuse", "warheads", "trigger"},
   ingredientSlotType = {0, 0, 0, 0, 1, 1, 1},
   resourceTypes = {"iron", "metal", "metal", "steel", "object/tangible/component/munition/shared_warhead_fuse.iff", "object/tangible/component/munition/shared_warhead_base.iff", "object/tangible/component/munition/shared_heavy_trigger_base.iff"},
   resourceQuantities = {150, 40, 25, 170, 1, 1, 1},
   contribution = {100, 100, 100, 100, 100, 100, 100},


   targetTemplate = "object/weapon/ranged/heavy/heavy_rocket_launcher.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_heavy_rocket_launcher, "object/draft_schematic/weapon/heavy_rocket_launcher.iff")
