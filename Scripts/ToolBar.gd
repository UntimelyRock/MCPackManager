extends MenuBar

class_name ToolBar

signal toolbar_action(toolbar_action_name : String)

static var fileStringIDs: Array = [
 	"save_texture_pack"
	,"open_texture_pack"
	,"open_sample_retrieval"
	,"bedrock_test"
	,"java_test"
]

static var projectStringIDs: Dictionary = {
	
}


func _on_file_index_pressed(index):
	emit_signal("toolbar_action", fileStringIDs[index])
	
