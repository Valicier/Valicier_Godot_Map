extends Control
signal imported
var cust_seed = []

func _on_close_pressed():
	hide()


func _on_import_pressed():
	cust_seed = str_to_var($PanelContainer/VBoxContainer/Insert/LineEdit.text)
	if typeof(cust_seed) != TYPE_ARRAY:
		$PanelContainer/VBoxContainer/Insert/LineEdit.text = ""
		$PanelContainer/VBoxContainer/Insert/LineEdit.placeholder_text = "Invalid Seed"
		$PanelContainer/VBoxContainer/Insert/LineEdit.release_focus()
	else:
		get_node("../").cust_seed = cust_seed
		emit_signal("imported")
		hide()


func _on_line_edit_gui_input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_node("../").editing = true
		get_node("../Camera3D").block_movement = true
		await get_tree().create_timer(.1).timeout
		get_node("../").editing = false
