VizslaHideout = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "VizslaHideout"
}

registerScreenPlay("VizslaHideout", true)

function VizslaHideout:start()
	if (isZoneEnabled("mandalore")) then
		self:spawnMobiles()
	end
end

function VizslaHideout:spawnMobiles()
	--Vizsla Hideout 
	
	spawnMobile("mandalore", "vizsla_loyalist", 120, 3.7, -13.6, -6.3, -18, 8566165)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 11.1, -23.6, -26.2, -6, 8566166)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -8.6, -30.6, -27.3, 90, 8566166)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -10.7, -37.3, -45.5, 8, 8566166)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -9.8, -41.1, -65.3, 0, 8566167)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -9.4, -40.4, -82.9, 38, 8566167)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 15.0, -40.1, -78.7, -54, 8566167)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 17.8, -42.7, -61.7, -98, 8566167)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 31.1, -45.1, -51.0, -125, 8566168)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 50.3, -46.6, -59.7, -79, 8566168)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 49.4, -46.1, -94.4, -39, 8566168)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 28.7, -45.5, -102.8, 47, 8566168)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 17.0, -45.4, -122.2, 27, 8566169)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -0.8, -45.7, -148.1, -6, 8566169)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -10.8, -44.5, -139.8, 54, 8566169)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 26.1, -52.9, -145.7, -12, 8566169)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 50.8, -51.2, -139.2, -55, 8566169)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 66.6, -46.0, -124.6, -91, 8566169)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 69.5, -54.5, -148.3, -44, 8566169)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 65.1, -57.0, -176.8, -40, 8566169)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 40.9, -57.3, -172.4, 8, 8566169)
	spawnMobile("mandalore", "vizsla_loyalist", 120, 10.6, -63.6, -183.2, 70, 8566170)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -11.3, -64.0, -186.8, 2, 8566170)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -14.9, -63.0, -261.3, -34, 8566171)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -22.4, -64.0, -254.8, 0, 8566171)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -10.3, -65.3, -241.4, 3, 8566171)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -4.5, -64.4, -227.5, -31, 8566171)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -20.1, -65.2, -214.8, 41, 8566171)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -1.9, -65.3, -210.0, -44, 8566171)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -32.4, -66.1, -180.5, 91, 8566170)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -53.8, -71.1, -187.2, 51, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -69.1, -68.7, -182.2, 79, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -71.2, -70.7, -157.8, 135, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -71.5, -69.9, -200.4, 53, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -93.7, -69.8, -202.5, 1, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -115.5, -68.9, -204.7, 42, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -122.2, -69.9, -185.8, 81, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -119.3, -68.9, -165.6, 117, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -95.1, -73.6, -171.9, 87, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -100.2, -70.3, -145.2, 168, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -124.4, -69.3, -141.1, 172, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -116.8, -69.3, -121.5, 140, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -93.8, -70.5, -123.8, -167, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -91.4, -69.7, -92.4, -158, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -63.5, -68.5, -109.3, -50, 8566173)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -52.2, -69.8, -83.4, -109, 8566173)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -33.2, -70.0, -99.0, -84, 8566173)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -12.5, -68.9, -95.6, -99, 8566173)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -25.6, -71.2, -116.0, -52, 8566173)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -24.7, -78.9, -136.7, -2, 8566174)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -41.5, -82.7, -146.1, 65, 8566174)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -67.2, -96.2, -146.0, 91, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -77.6, -99.5, -159.1, -4, 8566172)
	spawnMobile("mandalore", "vizsla_loyalist", 120, -98.4, -102.0, -137.3, 97, 8566172)
	spawnMobile("mandalore", "tor_vizsla", 3600, -90.7, -101.1, -102.6, -176, 8566175)
		
end