extends Control

@onready var label_lock = Global.label_lock
var system_mouse_enter = false
var system_pressed

func _process(delta):
	var cam_zoom = get_node("../Camera").zoom
	# Move Tooltips with Mouse
	if system_mouse_enter == true:
		get_node("../Tooltips/System Tooltip").global_position = Vector2(get_global_mouse_position().x - (get_node("../Tooltips/System Tooltip").get_size().x/cam_zoom.x)/2, get_global_mouse_position().y - (get_node("../Tooltips/System Tooltip").get_size()/cam_zoom.y).y)

# Show XP 101
func _on_xp_101_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 101[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_101_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_101_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 101")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 113
func _on_xp_113_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 113[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_113_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_113_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 113")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 124
func _on_xp_124_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 124[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_124_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_124_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 124")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 132
func _on_xp_132_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 132[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_132_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_132_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 132")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 140
func _on_xp_140_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 140[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_140_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_140_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 140")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 200
func _on_xp_200_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 200[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_200_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_200_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 200")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 203
func _on_xp_203_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 203[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_203_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_203_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 203")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 221
func _on_xp_221_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 221[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_221_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_221_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 221")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 233
func _on_xp_233_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 233[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_233_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_233_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 233")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 312
func _on_xp_312_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 312[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_312_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_312_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 312")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 315
func _on_xp_315_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 315[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_315_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_315_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 315")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 320
func _on_xp_320_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 320[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_320_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_320_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 320")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 333
func _on_xp_333_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 333[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_333_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_333_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 333")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 341
func _on_xp_341_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 341[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_341_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_341_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 341")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 414
func _on_xp_414_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 414[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_414_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_414_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 414")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 421
func _on_xp_421_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 421[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_421_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_421_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 421")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 422
func _on_xp_422_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 422[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_422_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_422_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 422")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 430
func _on_xp_430_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 430[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_430_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_430_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 430")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 441
func _on_xp_441_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 441[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_441_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_441_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 441")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 435
func _on_xp_435_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 435[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_435_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_435_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 435")
	if system_pressed.is_visible() == false:
		label_lock = false
	show_descriptions()

# Show XP 452
func _on_xp_452_mouse_entered():
	get_node("../Tooltips/System Tooltip").text = "[center]X-Ray Pulsar 452[/center]"
	get_node("../Tooltips/System Tooltip").show()
	system_mouse_enter = true
func _on_xp_452_mouse_exited():
	get_node("../Tooltips/System Tooltip").hide()
	system_mouse_enter = false
func _on_xp_452_pressed():
	system_pressed = get_node("../CanvasLayer/Sidebar/Descriptions/Pulsars/XP 452")
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
