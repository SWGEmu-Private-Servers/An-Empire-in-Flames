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


object_draft_schematic_structure_component_wall_module = object_draft_schematic_structure_component_shared_wall_module:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Wall Module",

	craftingToolTab = 1024, -- (See DraftSchematicObjectTemplate.h)
	complexity = 15,
	size = 6,
	factoryCrateSize = 10,

	xpType = "crafting_structure_general",
	xp = 1000,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n"},
	ingredientTitleNames = {"load_bearing_truss", "section_joints", "wall_foundation", "structure_modules"},
	ingredientSlotType = {0, 0, 0, 2},
	resourceTypes = {"metal", "metal", "ore", "object/tangible/component/structure/shared_structural_module.iff"},
	resourceQuantities = {200, 100, 200, 10},
	contribution = {100, 100, 100, 100},

	targetTemplate = "object/tangible/component/structure/wall_module.iff",

	additionalTemplates = {
				"object/tangible/borrie/wall/shared_asteroid_hutt_wall01.iff",
				"object/tangible/borrie/wall/shared_asteroid_hutt_wall02.iff",
				"object/tangible/borrie/wall/shared_asteroid_hutt_wall04.iff",
				"object/tangible/borrie/wall/shared_asteroid_hutt_wall05.iff",
--				"object/tangible/borrie/wall/shared_asteroid_light_wall01.iff",
				"object/tangible/borrie/wall/shared_asteroid_techwall03.iff",
--				"object/tangible/borrie/wall/shared_blacksun_transport_player_wall1.iff",
--				"object/tangible/borrie/wall/shared_blacksun_transport_player_wall2.iff",
--				"object/tangible/borrie/wall/shared_blacksun_transport_player_wall3.iff",
--				"object/tangible/borrie/wall/shared_blacksun_transport_player_wall4.iff",
				"object/tangible/borrie/wall/shared_bridge_revamped_star_destroyer_wall4.iff",
--				"object/tangible/borrie/wall/shared_bunker_crimelord_wall_b_wspec.iff",
				"object/tangible/borrie/wall/shared_cave_ice_wall.iff",
				"object/tangible/borrie/wall/shared_cave_rock_damp_wall.iff",
				"object/tangible/borrie/wall/shared_cave_rock_dry_wall.iff",
--				"object/tangible/borrie/wall/shared_corl_bars_a.iff",
				"object/tangible/borrie/wall/shared_corl_conc_trim_light.iff",
--				"object/tangible/borrie/wall/shared_corl_metal_scummy_deco.iff",
				"object/tangible/borrie/wall/shared_corl_sky_interior_wall.iff",
--				"object/tangible/borrie/wall/shared_corl_vent_a.iff",
				"object/tangible/borrie/wall/shared_dath_prison_wall_a.iff",
				"object/tangible/borrie/wall/shared_despot_ext_walls_a1.iff",
				"object/tangible/borrie/wall/shared_exarkun_intr_wall_a.iff",
				"object/tangible/borrie/wall/shared_exarkun_intr_wall_c.iff",
				"object/tangible/borrie/wall/shared_hospital_wall_blue_lined_phong.iff",
				"object/tangible/borrie/wall/shared_hospital_wall_details_horiz_phong.iff",
				"object/tangible/borrie/wall/shared_imperial_gunboat_int_wall_a_phong.iff",
				"object/tangible/borrie/wall/shared_impl_int_wall_b_blank.iff",
--				"object/tangible/borrie/wall/shared_impl_int_wall_b_blank_grunge.iff",
--				"object/tangible/borrie/wall/shared_impl_int_wall_b_grunge.iff",
				"object/tangible/borrie/wall/shared_impl_int_wall_b_research.iff",
				"object/tangible/borrie/wall/shared_impl_int_wall_b_vents.iff",
--				"object/tangible/borrie/wall/shared_impl_int_wall_d_grunge_phong.iff",
--				"object/tangible/borrie/wall/shared_impl_int_wall_e_grunge_phong.iff",
--				"object/tangible/borrie/wall/shared_impl_int_wall_f_grunge_phong.iff",
				"object/tangible/borrie/wall/shared_impl_int_wall_metal.iff",
--				"object/tangible/borrie/wall/shared_impl_int_wall_metal_grunge.iff",
				"object/tangible/borrie/wall/shared_intr_assoc_wall_a.iff",
				"object/tangible/borrie/wall/shared_intr_combat_wall_a.iff",
				"object/tangible/borrie/wall/shared_intr_commerce_wall_a.iff",
				"object/tangible/borrie/wall/shared_intr_commerce_wall_b.iff",
				"object/tangible/borrie/wall/shared_intr_cptl_tatt_wall_a1.iff",
				"object/tangible/borrie/wall/shared_intr_cptl_tatt_wall_a2.iff",
--				"object/tangible/borrie/wall/shared_intr_cptl_tatt_wall_trim_a1.iff",
--				"object/tangible/borrie/wall/shared_nboo_flow_crmsn_sparse.iff",
--				"object/tangible/borrie/wall/shared_nboo_flow_crmsn_clmn.iff",
				"object/tangible/borrie/wall/shared_nboo_intr_palace_marble_darkgrey.iff",
				"object/tangible/borrie/wall/shared_nboo_intr_throne_marble_red.iff",
--				"object/tangible/borrie/wall/shared_nboo_intr_throne_marble_reddeco.iff",
				"object/tangible/borrie/wall/shared_ply_corl_accent_c.iff",
--				"object/tangible/borrie/wall/shared_ply_corl_ceiling_a.iff",
--				"object/tangible/borrie/wall/shared_ply_nboo_carpetred.iff",
				"object/tangible/borrie/wall/shared_ply_nboo_marblewalltrim.iff",
				"object/tangible/borrie/wall/shared_ply_nboo_marblewhite.iff",
				"object/tangible/borrie/wall/shared_rebl_int_wall_a.iff",
				"object/tangible/borrie/wall/shared_sd_mainwall.iff",
--				"object/tangible/borrie/wall/shared_sd_reactor_wall.iff",
--				"object/tangible/borrie/wall/shared_star_destroyer_lightswall.iff",
				"object/tangible/borrie/wall/shared_star_destroyer_wall4.iff",
--				"object/tangible/borrie/wall/shared_tatt_stco_player_wall_ribbed.iff",
				"object/tangible/borrie/wall/shared_tatt_stco_player_wall1.iff",
				"object/tangible/borrie/wall/shared_tatt_stco_player_wall2.iff",
				"object/tangible/borrie/wall/shared_thed_impl_int_wall_a.iff",
--				"object/tangible/borrie/wall/shared_thm_tatt_debris_rust.iff",
--				"object/tangible/borrie/wall/shared_thm_tatt_grate_s01.iff",
--				"object/tangible/borrie/wall/shared_thm_tatt_jabba_floorplate.iff",
--				"object/tangible/borrie/wall/shared_thm_tatt_mtl_rustb.iff",
				"object/tangible/borrie/wall/shared_thm_tatt_tent.iff",
	}
}
ObjectTemplates:addTemplate(object_draft_schematic_structure_component_wall_module, "object/draft_schematic/structure/component/wall_module.iff")
