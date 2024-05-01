extends Control

@onready var label_lock = Global.label_lock
var system_mouse_enter = false
var system_pressed

func _process(delta):
	var cam_zoom = get_node("../Camera").zoom
	# Move Tooltips with Mouse
	if system_mouse_enter == true:
		get_node("../Tooltips/System Tooltip").global_position = Vector2(get_global_mouse_position().x - (get_node("../Tooltips/System Tooltip").get_size().x/cam_zoom.x)/2, get_global_mouse_position().y - (get_node("../Tooltips/System Tooltip").get_size()/cam_zoom.y).y)

# Show Sol
func _on_sol_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]Sol[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_sol_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_sol_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Sol")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show Miciri
func _on_miciri_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]Miciri[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_miciri_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_miciri_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Miciri")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show Kaikai
func _on_kaukai_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]Kaukai[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_kaukai_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_kaukai_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Kaukai")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show Utoths
func _on_utoths_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]Utoths[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_utoths_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_utoths_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Utoths")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show Shin'ta Homeworld
func _on_shinta_homeworld_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]Shin'ta Homeworld[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_shinta_homeworld_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_shinta_homeworld_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Shin'ta Homeworld")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show Vorma Homeworld
func _on_vorma_homeworld_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]Vorma Homeworld[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_vorma_homeworld_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_vorma_homeworld_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Vorma Homeworld")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Hide Descriptions
func hide_descriptions():
	for i in get_node("../CanvasLayer/Sidebar/Descriptions").get_children():
		for j in i.get_children():
			j.hide()

# Show Descriptions
func show_descriptions():
	if label_lock == false:
		label_lock = true
		get_node("../CanvasLayer/Sidebar").show()
		hide_descriptions()
		system_pressed.show()
	else:
		label_lock = false
		get_node("../CanvasLayer/Sidebar").hide()
