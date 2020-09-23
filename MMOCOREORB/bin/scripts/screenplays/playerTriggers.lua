PlayerTriggers = { }

function PlayerTriggers:playerLoggedIn(pPlayer)
	if (pPlayer == nil) then
		return
	end
	ServerEventAutomation:playerLoggedIn(pPlayer)
	BestineElection:playerLoggedIn(pPlayer)
	--createEvent(60 * 1000, "overquestScreenplay", "newPlayerStart", pPlayer, "")
	createEvent(90 * 1000, "HolocommScreenplay", "callPlayer", pPlayer, "")
end

function PlayerTriggers:playerLoggedOut(pPlayer)
	if (pPlayer == nil) then
		return
	end
	ServerEventAutomation:playerLoggedOut(pPlayer)
	EmpireDayEndorPvPScreenplay:removePlayerFromQueue(pPlayer)
end
