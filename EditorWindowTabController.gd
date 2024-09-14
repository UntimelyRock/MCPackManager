extends HBoxContainer
enum EditorMode {
	TEXTURE_EDITOR,
	TEXT_EDITOR
}

signal set_editor_mode(editor_mode: EditorMode)




func _on_texture_editor_button_pressed():
	emit_signal("set_editor_mode", EditorMode.TEXTURE_EDITOR)


func _on_text_editor_button_pressed():
	emit_signal("set_editor_mode", EditorMode.TEXT_EDITOR)
