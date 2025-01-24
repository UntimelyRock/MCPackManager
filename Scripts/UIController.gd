extends Control

signal selected_pack(pack_path: String)
signal update_left_editor_window(left_editor_contence: String)

var file = '' 

var blocklistFile: FileAccess
var blocknamesFile: FileAccess


# Called when the node enters the scene tree for the first time.
func _ready():
	
	loadConfig()

func loadConfig():
	#load/instantiate blocklist
	blocklistFile = FileAccess.open("user://blocklist.txt", FileAccess.READ)
	if blocklistFile == null:
		var blocklistFileDefault = FileAccess.open("res://config-default-recources/blocklist.txt", FileAccess.READ)
		blocklistFile = FileAccess.open("user://blocklist.txt", FileAccess.WRITE)
		blocklistFile.store_string(blocklistFileDefault.get_as_text())
		
	#load/instantiate blocknames
		blocknamesFile = FileAccess.open("user://blocknames.txt", FileAccess.READ)
	if blocknamesFile == null:
		var blocknamesFileDefault = FileAccess.open("res://config-default-recources/blocknames.txt", FileAccess.READ)
		blocknamesFile = FileAccess.open("user://blocknames.txt", FileAccess.WRITE)
		blocknamesFile.store_string(blocknamesFileDefault.get_as_text())
	

func open_pack_request():
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
	
func request_sample_retreval():
	var sampleRetriever = SampleRetrievalWindow.create()
	sampleRetriever.show()
	add_child(sampleRetriever)
	
	
func _test_file_tree():
	emit_signal("update_left_editor_window", blocklistFile.get_as_text())

func _on_pack_selected(path:String):
	print(path)
	emit_signal("selected_pack", path)

func _on_tool_bar_toolbar_action(toolbar_action_name):
	if toolbar_action_name ==	"save_texture_pack":
		print("Save Texturepack WIP")		
	elif toolbar_action_name ==	"open_texture_pack":
		open_pack_request()
	elif toolbar_action_name ==	"bedrock_test":
		_test_file_tree()
		emit_signal("selected_pack", "")
	elif toolbar_action_name ==	"java_test":
		_test_file_tree()
		emit_signal("selected_pack", "")	
	elif toolbar_action_name == "open_sample_retrieval":
		request_sample_retreval()
	
		
