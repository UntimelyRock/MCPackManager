extends Camera3D

var isControlling : bool = false
var programRoot:Control;
var rightMouseIsDown:bool = false
var lockedMousePos:Vector2 = Vector2(0,0)

func _ready():
	pass
	programRoot = get_tree().get_first_node_in_group("root")
	

func _on_controll_3dView():
	isControlling = true


func _on_stop_controll_3dView():
	isControlling = false



func _process(delta):
	if not isControlling and not rightMouseIsDown:
		return
	
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) and not rightMouseIsDown:
		lockedMousePos = Vector2(programRoot.get_global_mouse_position())
		rightMouseIsDown = true
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
	elif not Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) and rightMouseIsDown:
		rightMouseIsDown = false
		#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if rightMouseIsDown:
		var mouseDelta: Vector2 = lockedMousePos - programRoot.get_global_mouse_position()
		Input.warp_mouse(lockedMousePos)
		if Input.is_action_just_pressed("ui_zoom_in"):
			position.z -= 100 * delta
		if Input.is_action_just_pressed("ui_zoom_out"):
			position.z += 100 * delta
		var mouseV = mouseDelta * delta
		
		get_parent().rotation -= Vector3(mouseV.y, -mouseV.x, 0)
