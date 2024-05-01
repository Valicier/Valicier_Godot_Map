extends HBoxContainer

var button_mouse_enter = false

func _process(delta):
	var cam_zoom = get_node("../../Camera").zoom
	# Move Tooltips with Mouse
	if button_mouse_enter == true:
		get_node("../../Tooltips/Button Tooltip").global_position = Vector2(get_node("../../").get_global_mouse_position().x - (get_node("../../Tooltips/Button Tooltip").get_size().x/cam_zoom.x)/2, get_node("../../").get_global_mouse_position().y + (get_node("../../Tooltips/Button Tooltip").get_size().y/cam_zoom.y)/2)

# Quit Map
func _on_quit_mouse_entered():
	get_node("../../Tooltips/Button Tooltip").text = "[center]{Esc}[/center]"
	get_node("../../Tooltips/Button Tooltip").show()
	button_mouse_enter = true
func _on_quit_mouse_exited():
	get_node("../../Tooltips/Button Tooltip").hide()
	button_mouse_enter = false
func _on_quit_pressed():
	get_tree().quit()

# Territories
func _on_territories_mouse_entered():
	get_node("../../Tooltips/Button Tooltip").text = "[center]{t}[/center]"
	get_node("../../Tooltips/Button Tooltip").show()
	button_mouse_enter = true
func _on_territories_mouse_exited():
	get_node("../../Tooltips/Button Tooltip").hide()
	button_mouse_enter = false
func _on_territories_toggled(button_pressed):
	# Show Overlay
	if get_node("../../Territory Overlay").is_visible() == false:
		get_node("../../Territory Overlay").show()
	else:
		get_node("../../Territory Overlay").hide()
	# Chnage Name
	if get_node("Territories").text == "Show Territories":
		get_node("Territories").text = "Hide Territories"
	elif get_node("Territories").text == "Hide Territories":
		get_node("Territories").text = "Show Territories"

# System Visibility
func _on_system_visibility_mouse_entered():
	get_node("../../Tooltips/Button Tooltip").text = "[center]{s}[/center]"
	get_node("../../Tooltips/Button Tooltip").show()
	button_mouse_enter = true
func _on_system_visibility_mouse_exited():
	get_node("../../Tooltips/Button Tooltip").hide()
	button_mouse_enter = false
func _on_system_visibility_toggled(button_pressed):
	# Show Overlay
	if get_node("../../Systems").is_visible() == true:
		get_node("../../Systems").hide()
		get_node("../../Tooltips/System Tooltip").hide()
	else:
		get_node("../../Systems").show()
	# Chnage Name
	if get_node("System Visibility").text == "Show Systems":
		get_node("System Visibility").text = "Hide Systems"
	elif get_node("System Visibility").text == "Hide Systems":
		get_node("System Visibility").text = "Show Systems"

# Pulsar Visibility
func _on_pulsars_mouse_entered():
	get_node("../../Tooltips/Button Tooltip").text = "[center]{p}[/center]"
	get_node("../../Tooltips/Button Tooltip").show()
	button_mouse_enter = true
func _on_pulsars_mouse_exited():
	get_node("../../Tooltips/Button Tooltip").hide()
	button_mouse_enter = false
func _on_pulsars_toggled(button_pressed):
	# Show Overlay
	if get_node("../../Pulsars").is_visible() == true:
		get_node("../../Pulsars").hide()
#		get_node("../../Tooltips/Pulsar Tooltip").hide()
	else:
		get_node("../../Pulsars").show()
	# Chnage Name
	if get_node("Pulsars").text == "Show Pulsars":
		get_node("Pulsars").text = "Hide Pulsars"
	elif get_node("Pulsars").text == "Hide Pulsars":
		get_node("Pulsars").text = "Show Pulsars"
