FireCannonsCommand = {
        name = "firecannons",
	damageMultiplier = 1,
	speedMultiplier = 1,

	combatSpam = "attack",
   	animation = "droid_attack", 
	animType = GENERATE_INTENSITY,

	healthCostMultiplier = 0,
	actionCostMultiplier = 0,
	mindCostMultiplier = 0,
	forceCostMultiplier = 0,
	visMod = 25,

	range = -1,
	
	trails = NOTRAIL,

	poolsToDamage = HEALTH_ATTRIBUTE
}

AddCommand(FireCannonsCommand)

