--EiF 2018


object_draft_schematic_weapon_pistol_a280 = object_draft_schematic_weapon_shared_pistol_a280:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Ultralight A280",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 21, 
   size = 3, 

   xpType = "crafting_weapons_general", 
   xp = 60, 

   assemblySkill = "weapon_assembly", 
   experimentingSkill = "weapon_experimentation", 
   customizationSkill = "weapon_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n"},
   ingredientTitleNames = {"frame_assembly", "receiver_assembly", "grip_assembly", "base_pistol_core", "barrel", "scope"},
   ingredientSlotType = {0, 0, 0, 1, 1, 3},
   resourceTypes = {"metal", "chemical", "metal", "object/tangible/component/weapon/shared_base_pistol_core.iff", "object/tangible/component/weapon/shared_base_pistol_barrel.iff", "object/tangible/component/weapon/shared_scope_weapon.iff"},
   resourceQuantities = {30, 15, 10, 1, 1, 1},
   contribution = {100, 100, 100, 100, 100, 100},
   ingredientAppearance = {"", "", "", "", "", ""},


   targetTemplate = "object/weapon/ranged/pistol/pistol_a280.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_pistol_a280, "object/draft_schematic/weapon/pistol_a280.iff")
