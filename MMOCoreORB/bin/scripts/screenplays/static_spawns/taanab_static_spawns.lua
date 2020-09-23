--This is to be used for static spawns that are NOT part of caves, cities, dungeons, poi's, or other large screenplays.
TaanabStaticSpawnsScreenPlay = ScreenPlay:new 
{
	numberOfActs = 1,

	screenplayName = "TaanabStaticSpawnsScreenPlay",
}

registerScreenPlay("TaanabStaticSpawnsScreenPlay", true)

function TaanabStaticSpawnsScreenPlay:start()
	if (isZoneEnabled("taanab")) then
		self:spawnMobiles()
	end
end

function TaanabStaticSpawnsScreenPlay:spawnMobiles()

	--Need to add the rest of static spawns (Incomplete).

	--Test Area
	
end
