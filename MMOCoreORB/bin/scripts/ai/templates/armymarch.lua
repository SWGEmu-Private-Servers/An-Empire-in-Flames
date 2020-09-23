armymarchcharge = {
	{"idroot", "CompositeDefault", "none", SELECTORBEHAVIOR},
	{"move0", "MoveDefault", "idroot", BEHAVIOR},
	{"move1", "WaitDefault", "idroot", BEHAVIOR},
}

armymarch = {
	{"idroot", "CompositeDefault", "none", SELECTORBEHAVIOR},
	{"move0", "WalkDefault", "idroot", BEHAVIOR},
	{"move1", "WaitDefault", "idroot", BEHAVIOR},
}

addAiTemplate("armymarch", armymarch)
addAiTemplate("armymarchcharge", armymarchcharge)

