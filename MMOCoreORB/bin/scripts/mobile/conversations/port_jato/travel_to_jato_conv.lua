travelToJatoConvoTemplate = ConvoTemplate:new {
	initialScreen = "first_screen",
	templateType = "Lua",
	luaClassHandler = "travelToJatoConvoHandler",
	screens = {}
}

first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "",
	customDialogText = "You want to go to Port Jato? It's a dangerous run. 5000 credits, all in advance.",
	stopConversation = "false",
	options = {
				{"I'll pay it.", "goahead"},
	}
}
travelToJatoConvoTemplate:addScreen(first_screen);

goahead = ConvoScreen:new {
  id = "goahead",
  leftDialog = "",
  stopConversation = "true",
  options = { 
  }
}
travelToJatoConvoTemplate:addScreen(goahead);

insufficient_funds = ConvoScreen:new {
  id = "insufficient_funds",
  leftDialog = "",
  customDialogText = "Five thousand. Cash. Don't bother me unless you have the money.",
  stopConversation = "true",
  options = { 
  }
}
travelToJatoConvoTemplate:addScreen(insufficient_funds);

addConversationTemplate("travelToJatoConvoTemplate", travelToJatoConvoTemplate);
