extends Node



func _ready():
	print("PackControllerReady")



func _on_control_selected_pack(pack_path:String):
	var pathComponents = pack_path.split("/", false)
	print(pathComponents[-1])
	if(pathComponents[-1].to_lower() == "manifest.json"):
		pass
		
	if(pathComponents[-1].to_lower() == "pack.mcmeta"):
		pass
	
	
