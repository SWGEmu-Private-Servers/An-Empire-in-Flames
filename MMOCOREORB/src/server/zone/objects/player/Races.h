/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RACES_H_
#define RACES_H_

#include "system/lang.h"

const static char* Species[] = {
    	"human", 	// human male
    	"trandoshan", 	// trandoshan male
    	"twilek", 	// twilek male
    	"bothan", 	// bothan male
    	"zabrak", 	// zabrak male
    	"rodian", 	// rodian male
    	"moncal", 	// moncal male
    	"wookiee", 	// wookiee male
    	"sullustan", 	// sullustan male
    	"ithorian", 	// ithorian male
    	"human", 	// human female
    	"trandoshan", 	// trandoshan female
    	"twilek", 	// twilek female
    	"bothan", 	// bothan female
    	"zabrak", 	// zabrak female
    	"rodian", 	// rodian female
    	"moncal", 	// moncal female
    	"wookiee", 	// wookiee female
    	"sullustan", 	// sullustan female
    	"ithorian",  	// DA E7   -   ithorian female
	"hutt", 	// male hutt
	"hutt", 	// female hutt
	"nautolan", 	// male Nautolan
	"togruta", 	// female Togruta
	"chiss", 	// male chiss
	"chiss", 	// female chiss
	"devaronian", 	// male devaronian
	"gran", 	// male gran
	"ishi_tib", 	// male ishi tib
	"nightsister", 	// female nightsister
	"nikto", 	// male nikto
	"quarren", 	// male quarren
	"smc", 		// female singing mountain clan witch
	"weequay" ,	// male weequay
	"aqualish",	// male aqualish
	"aqualish",	// female aqualish
	"bith",		// male bith
	"bith",		// female bith
	"gotal",	// male gotal
	"talz",		// male talz
	"abyssin",	// male abyssin
	"arcona",	// male arcona
	"cerean",	// male cerean
	"duros",	// male duros
	"gungan",	// the most hated species in the galaxy
	"iktotchi",	// male iktotchi
	"jenet",	// male jenet
	"kel_dor",	// male kel dor
	"kubaz",	// male kubaz
	"sanyassan",	// male sanyassan
	"sanyassan",	// female sanyassan
	"chadra_fan",	// male chadra fan
	"chadra_fan",	// female chadra fan
	"droid",	// NK3 droid
	"dug",		// dug male
	"ewok",		// male ewok
	"ewok",		// female ewok
	"feeorin",	// male feeorin
	"geonosian",	// male geonosian
	"ortolan",	// male ortolan
	"togorian",	// male togorian
	"toydarian",	// male toydarian
	"mirialan",	// male mirialan
	"mirialan",	// female mirialan
	"zeltron",	// male zeltron
	"zeltron",	// female zeltron
	"narglatch",	// male narglatch
	"narglatch",	// female narglatch
};

const static int TemplateSpecies[] = {
		0, 	//human
		2, 	//trandoshan
		6, 	//twilek
		5, 	//bothan
		7, 	//zabrak
		1, 	//rodian
		3, 	//moncal
		4, 	//wookiee
		0x31, 	//sullustan
		0x21, 	//ithorian
		0, 	//human
		2, 	//trandoshan
		6, 	//twilek
		5, 	//bothan
		7, 	//zabrak
		1, 	//rodian
		3, 	//moncal
		4, 	//wookiee
		0x31,	//sullustan
		0x21,	//ithorian
		0x1f, 	//hutt
		0x1f, 	//hutt
		0, 	//nautolan
		0, 	//togruta
		0, 	//chiss
		0, 	//chiss
		0x11, 	//devaronian
		0x1c, 	//gran
		0x20, 	//ishi tib
		0, 	//nightsister
		0x2a, 	//nikto
		0x2e, 	//quarren
		0, 	//smc
		0x37, 	//weequay
		9, 	//aqualish
		9, 	//aqualish
		0x0e, 	//bith
		0x0e, 	//bith
		0x1b, 	//gotal
		0x32, 	//talz
		8, 	//abyssin
		0x0a, 	//arcona
		0, 	//cerean
		0x14, 	//duros
		0x1d, 	//gungan
		0, 	//iktotchi
		0, 	//jenet
		0, 	//kel dor
		0x27, 	//kubaz
		0x28, 	//sanyassin
		0x28, 	//sanyassin
		0x0e,	// male chadra fan
		0x0e,	// female chadra fan
		0,	// NK3 droid
		0x13,	// dug male
		0x16,	// male ewok
		0x16,	// female ewok
		0x17,	// male feeorin
		0,	// male geonosian
		0x2b,	// male ortolan
		4,	// male togorian
		0x35,	// male toydarian
		0,	// male mirialan
		0,	// female mirialan
		0,	// male zeltron
		0,	// female zeltron
		0x4a,	// male narglatch
		0x4a,	// female narglatch
};

const static char* Gender[] = {
    	"male", 	// human male
    	"male", 	// trandoshan male
    	"male", 	// twilek male
    	"male", 	// bothan male
    	"male", 	// zabrak male
    	"male", 	// rodian male
    	"male", 	// moncal male
    	"male", 	// wookiee male
    	"male", 	// sullustan male
    	"male", 	// ithorian male
    	"female", 	// human female
    	"female", 	// trandoshan female
    	"female", 	// twilek female
    	"female", 	// bothan female
    	"female", 	// zabrak female
    	"female", 	// rodian female
    	"female", 	// moncal female
    	"female", 	// wookiee female
    	"female", 	// sullustan female
    	"female",  	// DA E7   -   ithorian female
	"male", 	// hutt male
	"female", 	// hutt female
	"male", 	// nautolan male
	"female", 	// togruta female
	"male", 	// chiss male
	"female", 	// chiss female
	"male", 	// devaronian male
	"male", 	// gran male
	"male", 	// ishi tib male
	"female", 	// nightsister female
	"male", 	// nikto male
	"male", 	// quarren male
	"female", 	// smc female
	"male", 	// weequay male
	"male", 	// aqualish male
	"female", 	// aqualish female
	"male", 	// bith male
	"female", 	// bith female
	"male", 	// gotal male
	"male", 	// talz male
	"male", 	// abyssin
	"male", 	// arcona
	"male", 	// cerean
	"male", 	// duros
	"male", 	// gungan
	"male", 	// iktochi
	"male", 	// jenet
	"male", 	// kel dor
	"male", 	// kubaz
	"male", 	// sanyassin
	"female", 	// sanyassin
	"male",		// male chadra fan
	"female",	// female chadra fan
	"male",		// NK3 droid
	"male",		// dug male
	"male",		// male ewok
	"female",	// female ewok
	"male",		// male feeorin
	"male",		// male geonosian
	"male",		// male ortolan
	"male",		// male togorian
	"male",		// male toydarian
	"male",		// male mirialan
	"female",	// female mirialan
	"male",		// male zeltron
	"female",	// female zeltron
	"male",		// male narglatch
	"female",	// female narglatch

};

const static char* RaceStrs[] = {
    	"object/creature/player/shared_human_male.iff", 	// human male
    	"object/creature/player/shared_trandoshan_male.iff", 	// trandoshan male
    	"object/creature/player/shared_twilek_male.iff", 	// twilek male
    	"object/creature/player/shared_bothan_male.iff", 	// bothan male
    	"object/creature/player/shared_zabrak_male.iff", 	// zabrak male
    	"object/creature/player/shared_rodian_male.iff", 	// rodian male
    	"object/creature/player/shared_moncal_male.iff", 	// moncal male
    	"object/creature/player/shared_wookiee_male.iff", 	// wookiee male
    	"object/creature/player/shared_sullustan_male.iff", 	// sullustan male
    	"object/creature/player/shared_ithorian_male.iff", 	// ithorian male
    	"object/creature/player/shared_human_female.iff", 	// human female
    	"object/creature/player/shared_trandoshan_female.iff", 	// trandoshan female
    	"object/creature/player/shared_twilek_female.iff", 	// twilek female
    	"object/creature/player/shared_bothan_female.iff", 	// bothan female
    	"object/creature/player/shared_zabrak_female.iff", 	// zabrak female
    	"object/creature/player/shared_rodian_female.iff", 	// rodian female
    	"object/creature/player/shared_moncal_female.iff", 	// moncal female
    	"object/creature/player/shared_wookiee_female.iff", 	// wookiee female
    	"object/creature/player/shared_sullustan_female.iff", 	// sullustan female
    	"object/creature/player/shared_ithorian_female.iff",  	// DA E7   -   ithorian female
	"object/creature/player/shared_hutt_male.iff", 		// hutt male
	"object/creature/player/shared_hutt_female.iff", 	// hutt female
	"object/creature/player/shared_nautolan_male.iff", 	// nautolan male
	"object/creature/player/shared_togruta_female.iff", 	// togruta female
	"object/creature/player/shared_chiss_male.iff", 	// chiss male
	"object/creature/player/shared_chiss_female.iff", 	// chiss female
	"object/creature/player/shared_devaronian_male.iff", 	// devaronian male
	"object/creature/player/shared_gran_male.iff", 		// gran male
	"object/creature/player/shared_ishi_tib_male.iff", 	// ishi tib male
	"object/creature/player/shared_nightsister_female.iff", // nightsister female
	"object/creature/player/shared_nikto_male.iff", 	// nikto male
	"object/creature/player/shared_quarren_male.iff", 	// quarren male
	"object/creature/player/shared_smc_female.iff", 	// smc female
	"object/creature/player/shared_weequay_male.iff", 	// weequay male
	"object/creature/player/shared_aqualish_male.iff", 	// aqualish male
	"object/creature/player/shared_aqualish_female.iff", 	// aqualish female
	"object/creature/player/shared_bith_male.iff", 		// bith male
	"object/creature/player/shared_bith_female.iff", 	// bith female
	"object/creature/player/shared_gotal_male.iff", 	// gotal male
	"object/creature/player/shared_talz_male.iff", 		// talz male
	"object/creature/player/shared_abyssin_male.iff",	// abyssin male
	"object/creature/player/shared_arcona_male.iff",	// arcona male
	"object/creature/player/shared_cerean_male.iff",	// cerean male
	"object/creature/player/shared_duros_male.iff",		// duros male
	"object/creature/player/shared_gungan_male.iff",	// gungan male
	"object/creature/player/shared_iktotchi_male.iff",	// iktochi male
	"object/creature/player/shared_jenet_male.iff",		// jenet male
	"object/creature/player/shared_kel_dor_male.iff",	// kel dor male
	"object/creature/player/shared_kubaz_male.iff",		// kubaz male
	"object/creature/player/shared_sanyassan_male.iff",	// sanyassan male
	"object/creature/player/shared_sanyassan_female.iff",	// sanyassan female
	"object/creature/player/shared_chadra_fan_male.iff",	// male chadra fan
	"object/creature/player/shared_chadra_fan_female.iff",	// female chadra fan
	"object/creature/player/shared_droid_male.iff",		// NK3 droid
	"object/creature/player/shared_dug_male.iff",		// dug male
	"object/creature/player/shared_ewok_male.iff",		// male ewok
	"object/creature/player/shared_ewok_female.iff",	// female ewok
	"object/creature/player/shared_feeorin_male.iff",	// male feeorin
	"object/creature/player/shared_geonosian_male.iff",	// male geonosian
	"object/creature/player/shared_ortolan_male.iff",	// male ortolan
	"object/creature/player/shared_togorian_male.iff",	// male togorian
	"object/creature/player/shared_toydarian_male.iff",	// male toydarian
	"object/creature/player/shared_mirialan_male.iff",	// mirialan male
	"object/creature/player/shared_mirialan_female.iff",	// mirialan female
	"object/creature/player/shared_zeltron_male.iff",	// zeltron male
	"object/creature/player/shared_zeltron_female.iff",	// zeltron female
	"object/creature/player/shared_narglatch_male.iff",	// narglatch male
	"object/creature/player/shared_narglatch_female.iff",	// narglatch female
};

const static char* CCRaceStrs[] = {
    	"object/creature/player/human_male.iff", 	// human male
    	"object/creature/player/trandoshan_male.iff", 	// trandoshan male
    	"object/creature/player/twilek_male.iff", 	// twilek male
    	"object/creature/player/bothan_male.iff", 	// bothan male
    	"object/creature/player/zabrak_male.iff", 	// zabrak male
    	"object/creature/player/rodian_male.iff", 	// rodian male
    	"object/creature/player/moncal_male.iff", 	// moncal male
    	"object/creature/player/wookiee_male.iff", 	// wookiee male
    	"object/creature/player/sullustan_male.iff", 	// sullustan male
    	"object/creature/player/ithorian_male.iff", 	// ithorian male
    	"object/creature/player/human_female.iff", 	// human female
    	"object/creature/player/trandoshan_female.iff",	// trandoshan female
    	"object/creature/player/twilek_female.iff", 	// twilek female
    	"object/creature/player/bothan_female.iff", 	// bothan female
    	"object/creature/player/zabrak_female.iff", 	// zabrak female
    	"object/creature/player/rodian_female.iff", 	// rodian female
    	"object/creature/player/moncal_female.iff", 	// moncal female
    	"object/creature/player/wookiee_female.iff", 	// wookiee female
    	"object/creature/player/sullustan_female.iff", 	// sullustan female
    	"object/creature/player/ithorian_female.iff",  	// DA E7   -   ithorian female
	"object/creature/player/hutt_male.iff", 	// hutt male
	"object/creature/player/hutt_female.iff", 	// hutt female
	"object/creature/player/nautolan_male.iff", 	// nautolan male
	"object/creature/player/togruta_female.iff", 	// togruta female
	"object/creature/player/chiss_male.iff", 	// chiss male
	"object/creature/player/chiss_female.iff", 	// chiss female
	"object/creature/player/devaronian_male.iff", 	// devaronian male
	"object/creature/player/gran_male.iff", 	// gran male
	"object/creature/player/ishi_tib_male.iff", 	// ishi tib male
	"object/creature/player/nightsister_female.iff",// nightsister female
	"object/creature/player/nikto_male.iff", 	// nikto male
	"object/creature/player/quarren_male.iff", 	// quarren male
	"object/creature/player/smc_female.iff", 	// smc female
	"object/creature/player/weequay_male.iff", 	// weequay male
	"object/creature/player/aqualish_male.iff", 	// aqualish male
	"object/creature/player/aqualish_female.iff", 	// aqualish female
	"object/creature/player/bith_male.iff", 	// bith male
	"object/creature/player/bith_female.iff", 	// bith female
	"object/creature/player/gotal_male.iff", 	// gotal male
	"object/creature/player/talz_male.iff", 	// talz male
	"object/creature/player/abyssin_male.iff",	// abyssin male
	"object/creature/player/arcona_male.iff",	// arcona male
	"object/creature/player/cerean_male.iff",	// cerean male
	"object/creature/player/duros_male.iff",	// duros male
	"object/creature/player/gungan_male.iff",	// gungan male
	"object/creature/player/iktotchi_male.iff",	// iktotchi male
	"object/creature/player/jenet_male.iff",	// jenet male
	"object/creature/player/kel_dor_male.iff",	// kel dor male
	"object/creature/player/kubaz_male.iff",	// kubaz male
	"object/creature/player/sanyassan_male.iff",	// sanyassan male
	"object/creature/player/sanyassan_female.iff",	// sanyassan female
	"object/creature/player/chadra_fan_male.iff",	// male chadra fan
	"object/creature/player/chadra_fan_female.iff",	// female chadra fan
	"object/creature/player/droid_male.iff",	// NK3 droid
	"object/creature/player/dug_male.iff",		// dug male
	"object/creature/player/ewok_male.iff",		// male ewok
	"object/creature/player/ewok_female.iff",	// female ewok
	"object/creature/player/feeorin_male.iff",	// male feeorin
	"object/creature/player/geonosian_male.iff",	// male geonosian
	"object/creature/player/ortolan_male.iff",	// male ortolan
	"object/creature/player/togorian_male.iff",	// male togorian
	"object/creature/player/toydarian_male.iff",	// male toydarian
	"object/creature/player/mirialan_male.iff", 	// mirialan male
	"object/creature/player/mirialan_female.iff", 	// mirialan female
	"object/creature/player/zeltron_male.iff", 	// zeltron male
	"object/creature/player/zeltron_female.iff", 	// zeltron female
	"object/creature/player/narglatch_male.iff", 	// narglatch male
	"object/creature/player/narglatch_female.iff", 	// narglatch female
};

static uint32 SharedRace[] = {
    	0xAF1DC1A1, // human male
    	0x50C45B8F, // trandoshan male
    	0xF280E27B, // twilek male
    	0x5BF77F33, // bothan male
    	0xE204A556, // zabrak male
    	0x0BF9CD9C, // rodian male
    	0xB9C855A8, // mon cal male
    	0x0564791D, // wookiee male
    	0x0B9399A4, // sullustan male
    	0x38BAC7C4, // ithorian male
    	0xFFFFBBE9, // human female
    	0x183C24C6, // trandoshan female
    	0x849752DC, // twilek female
    	0x1D52730E, // bothan female
    	0xA9E35FFD, // zabrak female
    	0xC264245B, // rodian female
    	0x982FBFDE, // moncal female
    	0x0DAB65E2, // wookiee female
    	0x1573341A, // sullustan female
    	0xB3E08013, // ithorian female
	0x916443F9, // hutt male
	0xE0B607C0, // hutt female
	0xAB03ACB1, // nautolan male
	0x3D953B50, // togruta female
	0x02F60EAC, // chiss male
	0x614A1B68, // chiss female
	0x68731058, // devaronian male
	0xC2872D34, // gran male
	0x809EF398, // ishi tib male
	0xC56D9790, // nightsister female
	0x59ECB38B, // nikto male
	0x3435F686, // quarren male
	0x82A138F9, // smc female
	0x4F0718B5, // weequay male
	0xCEF4B4A1, // aqualish male
	0xDE63F629, // aqualish female
	0x73C992FF, // bith male
	0xB2C9CBE0, // bith female
	0x30CFFED2, // gotal male
	0xDBA89F7C, // talz male
	0xB0960636, // abyssin male
	0xA2A87F6E, // arcona male
	0x62EAF6FB, // cerean male
	0xA9BFEBF0, // duros male
	0x3A7F5790, // gungan male
	0xF9B11C30, // iktotchi male
	0x48B04347, // jenet male
	0x66DCE6EE, // kel dor male
	0x6BB072FA, // kubaz male
	0x57A4EC3E, // sanyassan male
	0x34E79C2B, // sanyassan female
	0xF9504963, // male chadra fan
	0xC6B70584, // female chadra fan
	0xDE6FB2E5, // NK3 droid
	0x696718D6, // dug male
	0x4B39AD7D, // male ewok
	0xBE49D88E, // female ewok
	0x60EDEA05, // male feeorin
	0x0D506AEA, // male geonosian
	0x65FBE4A7, // male ortolan
	0xA4478797, // male togorian
	0x3E751C09, // male toydarian
	0xD7349684, // male mirialan
	0xE9CC7F2D, // female mirialan
	0xE8975526, // male zeltron
	0x5B779FE7, // female zeltron
	0xF44DE4BE, // male narglatch
	0x0BC3FB30, // female narglatch

};

static unsigned int attributeLimits[50][19] = { //HAM
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},	
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},	
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},	
		{5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 5000, 6000, 47000},
};

class Races {
public:
	inline const static char* getRace(int raceid) {
		if (raceid < 0 || raceid > 67)
			return "";

		return RaceStrs[raceid];
	}

	inline static int getSpeciesID(int raceid) {
		if (raceid < 0 || raceid > 67)
			return 0;

		return TemplateSpecies[raceid];
	}

	inline const static char* getSpecies(int raceid) {
		if (raceid < 0 || raceid > 67)
			return "";

		return Species[raceid];
	}

	inline const static char* getGender(int raceid) {
		if (raceid < 0 || raceid > 67)
			return "";

		return Gender[raceid];
	}

	inline static uint32 getRaceCRC(int raceid) {
		if (raceid < 0 || raceid > 67)
			return 0;

		return SharedRace[raceid];
	}

	inline static const char* getCompleteRace(uint32 sharedRaceCRC) {
		int race = -1;
		for (int i = 0; i < 68; ++i) {
			if (SharedRace[i] == sharedRaceCRC) {
				race = i;
				break;
			}
		}

		if (race == -1)
			return "";
		else
			return CCRaceStrs[race];
	}

	inline static int getRaceID(const String& name) {
    	for (int i = 0; i < 68; i++) {
        	if (strcmp(name.toCharArray(), CCRaceStrs[i]) == 0)
            	return i;
    	}

    	return 0;
	}

	inline static unsigned int * getAttribLimits(int raceid) {
		return attributeLimits[raceid % 10];
	}

};

#endif /*RACES_H_*/
