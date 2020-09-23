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


object_tangible_component_weapon_gas_cartridge_advanced = object_tangible_component_weapon_shared_gas_cartridge_advanced:new {


	-- The values below are the default values.  To be used for blue frog objects primarily
	healthAttackCost = 10,
	actionAttackCost = 15,
	mindAttackCost = 10,
	forceCost = 0,

	pointBlankRange = 0,
	pointBlankAccuracy = 20,

	idealRange = 15,
	idealAccuracy = 50,

	maxRange = 64,
	maxRangeAccuracy = -80,

	minDamage = 25,
	maxDamage = 50,

	attackSpeed = 3.5,

	woundsRatio = 4,


	numberExperimentalProperties = {1, 1, 2, 2, 2},
	experimentalProperties = {"XX", "XX", "CD", "OQ", "CD", "OQ", "CD", "OQ"},
	experimentalWeights = {1, 1, 1, 1, 1, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "expDamage", "expDamage", "expSpeed"},
	experimentalSubGroupTitles = {"null", "null", "mindamage", "maxdamage", "attackspeed"},
	experimentalMin = {0, 0, 50, 225, 0.5},
	experimentalMax = {0, 0, 175, 375, -1.0},
	experimentalPrecision = {0, 0, 1, 1, 1},
	experimentalCombineType = {0, 0, 1, 1, 1},
}

ObjectTemplates:addTemplate(object_tangible_component_weapon_gas_cartridge_advanced, "object/tangible/component/weapon/gas_cartridge_advanced.iff")
