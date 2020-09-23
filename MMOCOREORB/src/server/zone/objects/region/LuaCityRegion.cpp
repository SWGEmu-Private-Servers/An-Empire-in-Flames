
#include "server/zone/objects/region/LuaCityRegion.h"
#include "server/zone/objects/region/CityRegion.h"

const char LuaCityRegion::className[] = "LuaCityRegion";

Luna<LuaCityRegion>::RegType LuaCityRegion::Register[] = {
		{ "_setObject", &LuaCityRegion::_setObject },
		{ "_getObject", &LuaCityRegion::_getObject },
		{ "isClientRegion", &LuaCityRegion::isClientRegion },
		{ "isCitizen", &LuaCityRegion::isCitizen },
		{ "getRegionDisplayedName", &LuaCityRegion::getRegionDisplayedName },
		{ "getRegion", &LuaCityRegion::getRegion },
		{ 0, 0 }
};

LuaCityRegion::LuaCityRegion(lua_State *L) {
	realObject = reinterpret_cast<CityRegion*>(lua_touserdata(L, 1));
}

LuaCityRegion::~LuaCityRegion() {
}

int LuaCityRegion::_getObject(lua_State* L) {
	if (realObject == nullptr)
		lua_pushnil(L);
	else
		lua_pushlightuserdata(L, realObject.get());

	return 1;
}

int LuaCityRegion::_setObject(lua_State* L) {
	realObject = reinterpret_cast<CityRegion*>(lua_touserdata(L, -1));

	return 0;
}

int LuaCityRegion::isClientRegion(lua_State* L) {
	bool val = realObject->isClientRegion();

	lua_pushboolean(L, val);

	return 1;
}

int LuaCityRegion::isCitizen(lua_State* L) {
	unsigned long playerID = lua_tointeger(L, -1);
	bool val = realObject->isCitizen(playerID);

	lua_pushboolean(L, val);

	return 1;
}

int LuaCityRegion::getRegionDisplayedName(lua_State* L) {
	String objname = realObject->getRegionDisplayedName();

	lua_pushstring(L, objname.toCharArray());

	return 1;
}

int LuaCityRegion::getRegion(lua_State* L) {
	int regionID = lua_tointeger(L, -1);

	Region* obj;

	obj = realObject->getRegion(regionID);

	lua_pushlightuserdata(L, obj);

	return 1;
}
