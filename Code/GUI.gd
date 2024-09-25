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
	if get_node("Territories").text == "Show Territories":
		get_node("Territories").text = "Hide Territories"
		get_node("../../Territory Overlay").show()
	elif get_node("Territories").text == "Hide Territories":
		get_node("Territories").text = "Show Territories"
		get_node("../../Territory Overlay").hide()

# System Visibility
func _on_system_visibility_mouse_entered():
	get_node("../../Tooltips/Button Tooltip").text = "[center]{s}[/center]"
	get_node("../../Tooltips/Button Tooltip").show()
	button_mouse_enter = true
func _on_system_visibility_mouse_exited():
	get_node("../../Tooltips/Button Tooltip").hide()
	button_mouse_enter = false
func _on_system_visibility_toggled(button_pressed):
	if get_node("System Visibility").text == "Show Systems":
		get_node("System Visibility").text = "Hide Systems"
		get_node("../../Systems").show()
	elif get_node("System Visibility").text == "Hide Systems":
		get_node("System Visibility").text = "Show Systems"
		get_node("../../Systems").hide()
		get_node("../../Tooltips/System Tooltip").hide()

# Pulsar Visibility
func _on_pulsars_mouse_entered():
	get_node("../../Tooltips/Button Tooltip").text = "[center]{p}[/center]"
	get_node("../../Tooltips/Button Tooltip").show()
	button_mouse_enter = true
func _on_pulsars_mouse_exited():
	get_node("../../Tooltips/Button Tooltip").hide()
	button_mouse_enter = false
func _on_pulsars_toggled(button_pressed):
	if get_node("Pulsars").text == "Show Pulsars":
		get_node("Pulsars").text = "Hide Pulsars"
		for i in get_node("../../Pulsars").get_children():
			i.self_modulate.a = 255
		get_node("../../Pulsars").show()
	elif get_node("Pulsars").text == "Hide Pulsars":
		get_node("Pulsars").text = "Show Pulsars"
		get_node("../../Pulsars").hide()

# Grid Visibility
func _on_grid_mouse_entered():
	get_node("../../Tooltips/Button Tooltip").text = "[center]{h}[/center]"
	get_node("../../Tooltips/Button Tooltip").show()
	button_mouse_enter = true
func _on_grid_mouse_exited():
	get_node("../../Tooltips/Button Tooltip").hide()
	button_mouse_enter = false
func _on_grid_pressed():
	if get_node("Grid").text == "Show Grid":
		get_node("Grid").text = "Hide Grid"
		get_node("../../Map No Lines").hide()
	elif get_node("Grid").text == "Hide Grid":
		get_node("Grid").text = "Show Grid"
		get_node("../../Map No Lines").show()

# Rift Visibility
func _on_rifts_mouse_entered():
	get_node("../../Tooltips/Button Tooltip").text = "[center]{r}[/center]"
	get_node("../../Tooltips/Button Tooltip").show()
	button_mouse_enter = true
func _on_rifts_mouse_exited():
	get_node("../../Tooltips/Button Tooltip").hide()
	button_mouse_enter = false
func _on_rifts_pressed():
	if get_node("Rifts").text == "Show Rifts":
		get_node("Rifts").text = "Hide Rifts"
		get_node("../../Rifts").show()
	elif get_node("Rifts").text == "Hide Rifts":
		get_node("Rifts").text = "Show Rifts"
		get_node("../../Rifts").hide()

# Other Node Visibility
func _on_other_mouse_entered():
	get_node("../../Tooltips/Button Tooltip").text = "[center]{o}[/center]"
	get_node("../../Tooltips/Button Tooltip").show()
	button_mouse_enter = true
func _on_other_mouse_exited():
	get_node("../../Tooltips/Button Tooltip").hide()
	button_mouse_enter = false
func _on_other_pressed():
	if get_node("Other").text == "Show Other":
		get_node("Other").text = "Hide Other"
		get_node("../../Other").show()
	elif get_node("Other").text == "Hide Other":
		get_node("Other").text = "Show Other"
		get_node("../../Other").hide()

# Gate Radii Visibility
func _on_gate_radii_mouse_entered():
	get_node("../../Tooltips/Button Tooltip").text = "[center]{g}[/center]"
	get_node("../../Tooltips/Button Tooltip").show()
	button_mouse_enter = true
func _on_gate_radii_mouse_exited():
	get_node("../../Tooltips/Button Tooltip").hide()
	button_mouse_enter = false
func _on_gate_radii_pressed():
	if get_node("Gate Radii").text == "Show Gate Radii":
		get_node("Gate Radii").text = "Hover Gate Radii"
		for i in get_node("../../Gate Radii").get_children():
			i.show()
	elif get_node("Gate Radii").text == "Hover Gate Radii":
		get_node("Gate Radii").text = "Hide Gate Radii"
		$"Gate Radii".button_pressed = true
		for i in get_node("../../Gate Radii").get_children():
			i.hide()
	elif get_node("Gate Radii").text == "Hide Gate Radii":
		get_node("Gate Radii").text = "Show Gate Radii"
		for i in get_node("../../Gate Radii").get_children():
			i.hide()




