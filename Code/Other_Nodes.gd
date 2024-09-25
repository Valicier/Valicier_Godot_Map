extends Control

@onready var label_lock = Global.label_lock
var system_mouse_enter = false
var system_pressed

func _process(delta):
	var cam_zoom = get_node("../Camera").zoom
	# Move Tooltips with Mouse
	if system_mouse_enter == true:
		get_node("../Tooltips/System Tooltip").global_position = Vector2(get_global_mouse_position().x - (get_node("../Tooltips/System Tooltip").get_size().x/cam_zoom.x)/2, get_global_mouse_position().y - (get_node("../Tooltips/System Tooltip").get_size()/cam_zoom.y).y)
