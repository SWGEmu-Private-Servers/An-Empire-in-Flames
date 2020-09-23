#ifndef FIELDFACTIONCHANGESUICALLBACK_H_
#define FIELDFACTIONCHANGESUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/player/FactionStatus.h"
#include "server/chat/StringIdChatParameter.h"

class FieldFactionChangeSuiCallback : public SuiCallback {
private:
	int newStatus;
public:
	virtual ~FieldFactionChangeSuiCallback() { }

	FieldFactionChangeSuiCallback(ZoneServer* server, int status)
		: SuiCallback(server) {
		newStatus = status;
	}

	void run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		if (cancelPressed || args->size() < 1) {
			player->sendSystemMessage("@gcw:abort_field_change"); // You cancel your factional change.
			return;
		}

		String arg1 = args->get(0).toString();

		if (arg1.toLowerCase() != "yes") {
			player->sendSystemMessage("@gcw:abort_field_change"); // You cancel your factional change.
			return;
		}

		if (player->getFutureFactionStatus() != -1)
			return;

		int curStatus = player->getFactionStatus();

		if (curStatus == newStatus)
			return;

		if (newStatus == FactionStatus::COVERT) {
		//	if (curStatus == FactionStatus::OVERT) {
		//		player->sendSystemMessage("@gcw:cannot_change_from_combatant_in_field"); // You cannot change you status to combatant in the field. Go talk to a faction recruiter.
		//		return;
		//	}

			player->sendSystemMessage("@gcw:handle_go_covert"); // You will be flagged as a Combatant in 30 seconds.
			player->setFutureFactionStatus(FactionStatus::COVERT);

			ManagedReference<CreatureObject*> creo = player->asCreatureObject();

			Core::getTaskManager()->scheduleTask([creo]{
				if(creo != nullptr) {
					Locker locker(creo);

					creo->setFactionStatus(FactionStatus::COVERT);
				}
			}, "UpdateFactionStatusTask", 30000);
		} else if (newStatus == FactionStatus::OVERT) {
			player->sendSystemMessage("You will be flagged as Special Forces in 30 seconds."); // No string available for overt.
			player->setFutureFactionStatus(FactionStatus::OVERT);

			ManagedReference<CreatureObject*> creo = player->asCreatureObject();

			Core::getTaskManager()->scheduleTask([creo]{
				if(creo != nullptr) {
					Locker locker(creo);

					creo->setFactionStatus(FactionStatus::OVERT);
				}
			}, "UpdateFactionStatusTask", 30000);
		} else if (newStatus == FactionStatus::ONLEAVE) {
			int duration = 60;
			if (curStatus == FactionStatus::OVERT)
				duration += 60;

		  	uint rank = player->getFactionRank();
			if (rank <= 4){
				player->sendSystemMessage("You are not an officer, and your request is being processed quickly. Your leave will be approved in approximately 3 minutes, but longer if you are special forces.");
				duration += 120;
			} else if ( rank >= 5 && rank <= 9){
				player->sendSystemMessage("Due to your rank as a non-commisioned officer, it will take approximately 5 minutes to process your leave request - longer if you are special forces.");
				duration += 240;
			} else if ( rank >= 10 && rank <= 15){
				player->sendSystemMessage("Due to your rank as an officer, it will take approximately 6.5 minutes to process your leave request - longer if you are special forces.");
				duration += 330;
			} else if ( rank >= 16 ){
				player->sendSystemMessage("Due to your rank, you are considered essential personnel. Your leave request has been denied.");
				return;
			}

			player->setFutureFactionStatus(FactionStatus::ONLEAVE);

			ManagedReference<CreatureObject*> creo = player->asCreatureObject();

			Core::getTaskManager()->scheduleTask([creo]{
				if(creo != nullptr) {
					Locker locker(creo);

					creo->setFactionStatus(FactionStatus::ONLEAVE);
				}
			}, "UpdateFactionStatusTask", duration * 1000);
		}
	}
};

#endif /* FIELDFACTIONCHANGESUICALLBACK_H_ */
