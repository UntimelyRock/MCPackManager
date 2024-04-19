extends Control

signal selected_pack(pack_path: String)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_open_pack_button_down():
	var pack_selector = FileDialog.new()
	pack_selector.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	pack_selector.filters = PackedStringArray(["manifest.json, *.mcpack ; Bedrock Edition Packs"])
	pack_selector.access = FileDialog.ACCESS_FILESYSTEM
	pack_selector.visible = true
	pack_selector.position = Vector2i(0,0)
	pack_selector.initial_position = Window.WINDOW_INITIAL_POSITION_CENTER_SCREEN_WITH_MOUSE_FOCUS
	pack_selector.size = Vector2i(500,500)
	pack_selector.set_current_path("%appdata%/.minecraft")
	pack_selector.connect("file_selected", _on_pack_selected)
	add_child(pack_selector)
	

func _on_pack_selected(path:String):
	print(path)
	emit_signal("selected_pack", path)
	


func _on_open_test_pack_button_down():
	emit_signal("selected_pack", "D:/Users/Desktop/bedrock-samples-1.20.70.6/bedrock-samples-1.20.70.6/resource_pack/manifest.json")


func _on_open_java_test_pack_button_down():
	emit_signal("selected_pack", "D:/Users/Desktop/VanillaDefault 1.20.4/pack.mcmeta")	
