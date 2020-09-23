/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef HolocronCommand_H_
#define HolocronCommand_H_

#include "server/zone/managers/director/DirectorManager.h"

class HolocronCommand : public QueueCommand {
public:

	HolocronCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		Lua* lua = DirectorManager::instance()->getLuaInstance();

		Reference<LuaFunction*> gatekeeper = lua->createFunction("HolocronScreenplay", "main", 0);
		*gatekeeper << creature;

		gatekeeper->callFunction();

		return SUCCESS;
	}

};

#endif //HolocronCommand_H_
