leaveJatoConvoTemplate = ConvoTemplate:new {
	initialScreen = "first_screen",
	templateType = "Lua",
	luaClassHandler = "leaveJatoConvoHandler",
	screens = {}
}

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "",
	customDialogText = "Ready to leave Port Jato? Just 500 credits and I'll drop you off while I make a supply run.",
	stopConversation = "false",
	options = {
				{"Coronet", "coronet"},
				{"Hutt Outpost", "rori_rebel_outpost"},
				{"Mos Eisley", "mos_eisley"},
				{"Nym's Stronghold", "nym"},
				{"Pirate Outpost", "dantooine_agro_outpost"},
				{"Smuggler Outpost", "endor_smuggler_outpost"},
				{"Starhunter Station", "starhunter"},
				{"Theed", "theed"},
	}
}
leaveJatoConvoTemplate:addScreen(first_screen);

coronet = ConvoScreen:new {
  id = "coronet",
  leftDialog = "",
  stopConversation = "true",
  options = { 
  }
}
leaveJatoConvoTemplate:addScreen(coronet);

rori_rebel_outpost = ConvoScreen:new {
  id = "rori_rebel_outpost",
  leftDialog = "",
  stopConversation = "true",
  options = { 
  }
}
leaveJatoConvoTemplate:addScreen(rori_rebel_outpost);

mos_eisley = ConvoScreen:new {
  id = "mos_eisley",
  leftDialog = "",
  stopConversation = "true",
  options = { 
  }
}
leaveJatoConvoTemplate:addScreen(mos_eisley);

nym = ConvoScreen:new {
  id = "nym",
  leftDialog = "",
  stopConversation = "true",
  options = { 
  }
}
leaveJatoConvoTemplate:addScreen(nym);

dantooine_agro_outpost = ConvoScreen:new {
  id = "dantooine_agro_outpost",
  leftDialog = "",
  stopConversation = "true",
  options = { 
  }
}
leaveJatoConvoTemplate:addScreen(dantooine_agro_outpost);

endor_smuggler_outpost = ConvoScreen:new {
  id = "endor_smuggler_outpost",
  leftDialog = "",
  stopConversation = "true",
  options = { 
  }
}
leaveJatoConvoTemplate:addScreen(endor_smuggler_outpost);

starhunter = ConvoScreen:new {
  id = "starhunter",
  leftDialog = "",
  stopConversation = "true",
  options = { 
  }
}
leaveJatoConvoTemplate:addScreen(starhunter);

theed = ConvoScreen:new {
  id = "theed",
  leftDialog = "",
  stopConversation = "true",
  options = { 
  }
}
leaveJatoConvoTemplate:addScreen(theed);

insufficient_funds = ConvoScreen:new {
  id = "insufficient_funds",
  leftDialog = "",
  customDialogText = "Five hundred. Cash. Don't bother me unless you have the money.",
  stopConversation = "true",
  options = { 
  }
}
leaveJatoConvoTemplate:addScreen(insufficient_funds);

addConversationTemplate("leaveJatoConvoTemplate", leaveJatoConvoTemplate);
