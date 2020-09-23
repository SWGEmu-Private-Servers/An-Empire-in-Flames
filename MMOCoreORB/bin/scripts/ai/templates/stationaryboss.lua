stationaryboss = {
	{"root", "CompositeDefault", "none", SELECTORBEHAVIOR},
	{"attack", "CompositeDefault", "root", SEQUENCEBEHAVIOR},
	{"idle", "CompositeDefault", "root", SEQUENCEBEHAVIOR},
	{"idle0", "WaitDefault", "root", BEHAVIOR},
	{"attack0", "GetTarget", "attack", BEHAVIOR},
	{"attack1", "SelectWeapon", "attack", BEHAVIOR},
	{"attack2", "SelectAttack", "attack", BEHAVIOR},
}

addAiTemplate("stationaryboss", stationaryboss)
