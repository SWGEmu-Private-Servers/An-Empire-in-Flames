--Should all created players start with God Mode? 1 = yes, 0 = no
freeGodMode = 0;
--How many cash credits new characters start with after creating a character (changed during test phase, normal value is 100)
startingCash = 100
--startingCash = 100000
--How many bank credits new characters start with after creating a character (changed during test phase, normal value is 1000)
startingBank = 1000
--startingBank = 100000
--How many skill points a new characters start with
skillPoints = 250

professions = {
	"combat_bountyhunter",
	"combat_smuggler",
	"combat_commando",
	"crafting_merchant",
	"outdoors_squadleader",
	"outdoors_ranger",
	"science_doctor",
	"social_entertainer"
}

marksmanPistol = "object/weapon/ranged/pistol/pistol_cdef.iff"
	
marksmanRifle = "object/weapon/ranged/rifle/rifle_cdef.iff"

marksmanCarbine = "object/weapon/ranged/carbine/carbine_cdef.iff"

marksmanHeavy = "object/weapon/ranged/rifle/rifle_flame_thrower.iff"

brawlerOneHander = "object/weapon/melee/knife/knife_stone.iff"

brawlerTwoHander = "object/weapon/melee/axe/axe_heavy_duty.iff"

brawlerPolearm = "object/weapon/melee/polearm/lance_staff_wood_s1.iff"

survivalKnife = "object/weapon/melee/knife/knife_survival.iff"

genericTool = "object/tangible/crafting/station/generic_tool.iff"

foodTool = "object/tangible/crafting/station/food_tool.iff"

mineralTool = "object/tangible/survey_tool/survey_tool_mineral.iff"

chemicalTool = "object/tangible/survey_tool/survey_tool_liquid.iff"

slitherhorn = "object/tangible/instrument/slitherhorn.iff"

marojMelon = "object/tangible/food/foraged/foraged_fruit_s1.iff"

x31Speeder = "object/tangible/deed/vehicle_deed/speederbike_flash_deed.iff"

professionSpecificItems = {
	combat_bountyhunter = { marksmanCarbine, marksmanPistol, marksmanRifle, brawlerTwoHander, brawlerPolearm },
	combat_commando = { marksmanHeavy, marksmanCarbine, marksmanPistol, marksmanRifle, brawlerTwoHander, brawlerPolearm },
	combat_smuggler = { marksmanCarbine, marksmanPistol, marksmanRifle, brawlerTwoHander, brawlerPolearm },
	crafting_merchant = { genericTool, mineralTool, chemicalTool, foodTool },
	outdoors_ranger = { genericTool, marksmanCarbine, marksmanPistol, marksmanRifle, brawlerTwoHander, brawlerPolearm },
	outdoors_squadleader = { marksmanCarbine, marksmanPistol, marksmanRifle, brawlerTwoHander, brawlerPolearm },
	science_doctor = { genericTool, mineralTool, chemicalTool, foodTool },
	social_entertainer = { slitherhorn }
}

commonStartingItems = { marojMelon, survivalKnife, x31Speeder }
