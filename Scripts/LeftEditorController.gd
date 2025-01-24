extends Control
var fileTree: Tree
var regexWhitespace = RegEx.new()

func _ready():
	regexWhitespace.compile("\\s+")
	

func _on_treeitem_click(event):
	print(event)

func _on_control_update_left_editor_window(left_editor_contents: String):
	fileTree = Tree.new()
	fileTree.hide_root = false
	fileTree.set_anchors_preset(Control.PRESET_FULL_RECT)
	var treeRoot : TreeItem = fileTree.create_item()
	var lines = left_editor_contents.split("\n", false)
	var last_tree_item = treeRoot
	var treeDepths: Array[int] = [0]
	
	fileTree.show()
	
	#parese file whitespace
	for line: String in lines:
		if not line.begins_with("//"):
			var whitespaceStr = regexWhitespace.search(line)
			var lineDepth: int = whitespaceStr.get_string().length() if (whitespaceStr != null) else 0
			
			while lineDepth < treeDepths[-1]:
				last_tree_item = last_tree_item.get_parent()
				treeDepths.remove_at(treeDepths.size() - 1)
			var newTreeItem: TreeItem
			if lineDepth > treeDepths[-1]:
				newTreeItem = fileTree.create_item(last_tree_item)
				treeDepths.append(lineDepth)
			else:
				newTreeItem = fileTree.create_item(last_tree_item.get_parent())
			newTreeItem.set_text(0, line.replace("\\s+", ""))
			newTreeItem.set_collapsed_recursive(true)
			last_tree_item = newTreeItem
			newTreeItem.connect("InputEventMouseButton", _on_treeitem_click)
	add_child(fileTree)
