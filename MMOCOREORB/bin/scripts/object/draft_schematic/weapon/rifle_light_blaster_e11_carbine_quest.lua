--Copyright (C) 2010 <SWGEmu>


--This File is part of Core3.

--This program is free software; you can redistribute 
--it and/or modify it under the terms of the GNU Lesser 
--General Public License as published by the Free Software
--Foundation; either version 2 of the License, 
--or (at your option) any later version.

--This program is distributed in the hope that it will be useful, 
--but WITHOUT ANY WARRANTY; without even the implied warranty of 
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
--See the GNU Lesser General Public License for
--more details.

--You should have received a copy of the GNU Lesser General 
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

--Linking Engine3 statically or dynamically with other modules 
--is making a combined work based on Engine3. 
--Thus, the terms and conditions of the GNU Lesser General Public License 
--cover the whole combination.

--In addition, as a special exception, the copyright holders of Engine3 
--give you permission to combine Engine3 program with free software 
--programs or libraries that are released under the GNU LGPL and with 
--code included in the standard release of Core3 under the GNU LGPL 
--license (or modified versions of such code, with unchanged license). 
--You may copy and distribute such a system following the terms of the 
--GNU LGPL for Engine3 and the licenses of the other code concerned, 
--provided that you include the source code of that other code when 
--and as the GNU LGPL requires distribution of source code.

--Note that people who make modified versions of Engine3 are not obligated 
--to grant this special exception for their modified versions; 
--it is their choice whether to do so. The GNU Lesser General Public License 
--gives permission to release a modified version without this exception; 
--this exception also makes it possible to release a modified version 


object_draft_schematic_weapon_rifle_light_blaster_e11_carbine_quest = object_draft_schematic_weapon_shared_rifle_light_blaster_e11_carbine_quest:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Schematic: Enhanced E11 Carbine",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 30, 
   size = 1, 
   factoryCrateSize = 0,

   xpType = "crafting_weapons_general", 
   xp = 140, 

   assemblySkill = "weapon_assembly", 
   experimentingSkill = "weapon_experimentation", 
   customizationSkill = "weapon_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n"},
   ingredientTitleNames = {"frame_assembly", "receiver_assembly", "grip_assembly", "base_carbine_core", "barrel", "scope", "stock"},
   ingredientSlotType = {0, 0, 0, 1, 1, 3, 3},
   resourceTypes = {"metal", "chemical", "metal", "object/tangible/component/weapon/shared_base_carbine_core.iff", "object/tangible/component/weapon/shared_base_carbine_barrel.iff", "object/tangible/component/weapon/shared_scope_weapon.iff", "object/tangible/component/weapon/shared_stock.iff"},
   resourceQuantities = {12, 6, 3, 1, 1, 1, 1},
   contribution = {100, 100, 100, 100, 100, 100, 100},
   ingredientAppearance = {"", "", "", "", "muzzle", "scope", "stock"},


   targetTemplate = "object/weapon/ranged/carbine/carbine_e11_quest.iff",

   additionalTemplates = {
              "object/weapon/ranged/carbine/shared_carbine_e11.iff",
             },

	weaponDots = {
		{
			{"type", 4}, -- 1 = Poison, 2 = Disease, 3 = Fire, 4 = Bleed
			{"attribute", 0}, -- See CreatureAttributes.h in src for numbers.
			{"strength", 300},
			{"duration", 120},
			{"potency", 150},
			{"uses", 9000}
		}
	},

}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_rifle_light_blaster_e11_carbine_quest, "object/draft_schematic/weapon/rifle_light_blaster_e11_carbine_quest.iff")
