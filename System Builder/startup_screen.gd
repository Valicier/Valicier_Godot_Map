extends Control

func _on_button_pressed():
	queue_free()
	get_node("../GUI/VBoxContainer/Speed Control/Speed Edit").text = str(1)
	get_node("../Camera3D").block_movement = false
