--EiF heavvy weapons crafting revamp
--2017

object_draft_schematic_weapon_rifle_flame_thrower = object_draft_schematic_weapon_shared_rifle_flame_thrower:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Flame Thrower",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 44, 
   size = 3, 

   xpType = "crafting_weapons_general", 
   xp = 550, 

   assemblySkill = "weapon_assembly", 
   experimentingSkill = "weapon_experimentation", 
   customizationSkill = "weapon_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n"},
   ingredientTitleNames = {"frame_assembly", "receiver_assembly", "grip_assembly", "enhanced_cooling_mechanism", "nozzle", "tank", "valve"},
   ingredientSlotType = {0, 0, 0, 0, 1, 1, 1},
   resourceTypes = {"steel", "iron", "metal", "gemstone_crystalline", "object/tangible/component/munition/shared_nozzle_base.iff", "object/tangible/component/munition/shared_tank_base.iff", "object/tangible/component/munition/shared_control_valve.iff"},
   resourceQuantities = {150, 40, 20, 45, 1, 1, 1},
   contribution = {100, 100, 100, 100, 100, 100, 100},


   targetTemplate = "object/weapon/ranged/rifle/rifle_flame_thrower.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_rifle_flame_thrower, "object/draft_schematic/weapon/rifle_flame_thrower.iff")
