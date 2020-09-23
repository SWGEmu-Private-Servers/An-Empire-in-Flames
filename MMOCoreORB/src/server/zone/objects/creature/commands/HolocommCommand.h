/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef HolocommCommand_H_
#define HolocommCommand_H_

#include "server/zone/managers/director/DirectorManager.h"

class HolocommCommand : public QueueCommand {
public:

	HolocommCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		Lua* lua = DirectorManager::instance()->getLuaInstance();

		Reference<LuaFunction*> holoCall = lua->createFunction("HolocommScreenplay", "main", 0);
		*holoCall << creature;

		holoCall->callFunction();

		return SUCCESS;
	}

};

#endif //HolocommCommand_H_
