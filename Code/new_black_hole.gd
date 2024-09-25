extends TextureButton

@onready var Tooltip = get_node("../../Tooltips/System Tooltip")
@onready var Other = get_node("../")
@onready var Gate_Radii_Toggle = get_node("../../CanvasLayer/GUI/Gate Radii")


func _on_mouse_entered():
	Tooltip.text = "[center]" + name + "[/center]"
	Tooltip.show()
	Other.system_mouse_enter = true
	get_node("../../Gate Radii/"+name).modulate.a = .65
	if Gate_Radii_Toggle.text == "Hide Gate Radii":
		get_node("../../Gate Radii/"+name).show()

func _on_mouse_exited():
	Tooltip.hide()
	Other.system_mouse_enter = false
	get_node("../../Gate Radii/"+name).modulate.a = 0.156
	if Gate_Radii_Toggle.text == "Hide Gate Radii":
		get_node("../../Gate Radii/"+name).hide()
