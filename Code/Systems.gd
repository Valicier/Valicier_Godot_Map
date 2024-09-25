extends Control

@onready var label_lock = Global.label_lock
@onready var cust_seed = Global.cust_seed
var system_mouse_enter = false
var system_pressed

func _process(delta):
	var cam_zoom = get_node("../Camera").zoom
	# Move Tooltips with Mouse
	if system_mouse_enter == true:
		get_node("../Tooltips/System Tooltip").global_position = Vector2(get_global_mouse_position().x - (get_node("../Tooltips/System Tooltip").get_size().x/cam_zoom.x)/2, get_global_mouse_position().y - (get_node("../Tooltips/System Tooltip").get_size()/cam_zoom.y).y)


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


# System Pressed
func _on_sol_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Sol")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

func _on_miciri_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Miciri")
	if system_pressed.is_visible() == false:
		label_lock = false
	Global.cust_seed = ["Sun", 6865000, 0, 0, 28.646, 5, "Miciri", "Vector4(1, 0.745098, 0, 1)", "Vector4(1, 0.745098, 0, 1)", "Planet", 5922.7, 702.76, 0.11806375442739, 4.662, 1, "Miciri I", "Vector4(1, 1, 1, 1)", 0, "Planet", 5730.29, 1166.3, 0.05560498220641, 5.023, 0, "Miciri II", "Vector4(1, 1, 1, 1)", 0, "Planet", 5375.39, 1500.1, 0.03764351590439, 3.827, 0, "Miciri III", "Vector4(1, 1, 1, 1)", 0, "Planet", 9574.54, 2612.2, 0.01645196847803, 22.004, 0, "Miciri IV", "Vector4(1, 1, 1, 1)", 0]
	show_descriptions()

func _on_kaukai_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Kaukai")
	if system_pressed.is_visible() == false:
		label_lock = false
	Global.cust_seed = []
	show_descriptions()

func _on_utoths_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Utoths")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

func _on_shinta_homeworld_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Shin'ta Homeworld")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

func _on_vorma_homeworld_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Vorma Homeworld")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

func _on_gullwing_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Gullwing")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

func _on_ancient_homeworld_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Systems/Ancient Homeworld")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()
