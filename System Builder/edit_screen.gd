extends Control

@onready var radius = get_node("../").radius
@onready var orbit = get_node("../").orbital_distance
@onready var period = get_node("../").period
@onready var mass = get_node("../").mass
@onready var type = get_node("../").type
@onready var planet_name = get_node("../").cust_name
@onready var custom_color_X = get_node("../").cust_color_X
var custom_color = Vector4(255, 255, 255, 255)

@onready var Main = get_node("../../../")
@onready var Camera = get_node("../../../Camera3D")
@onready var editing = Main.editing

@onready var radius_scalar = get_node("../../../").radius_scalar
@onready var orbit_scalar = get_node("../../../").orbit_scalar

var regex = RegEx.new()
var title_old_text = ""
var radius_old_text = ""
var orbit_old_text = ""
var period_old_text = ""
var mass_old_text = ""
var custom_color_r_old_text = 255
var custom_color_g_old_text = 255
var custom_color_b_old_text = 255
var custom_color_a_old_text = 255

func _ready():
	$"VBoxContainer/Title/Title LineEdit".text = planet_name
	get_node("../Label3D").text = planet_name
	var title_old_text = planet_name
	$"VBoxContainer/Radius/Edit/Radius LineEdit".text = str( snapped(radius, 0.01) )
	var radius_old_text = str( snapped(radius, 0.01) )
	$"VBoxContainer/Orbit/Edit/Orbit LineEdit".text = str( snapped(orbit, 0.01) )
	var orbit_old_text = str( snapped(orbit, 0.01) )
	$"VBoxContainer/Period/Edit/Period LineEdit".text = str( snapped( 1/period, 0.01) )
	var period_old_text = str( 1/ snapped(period, 0.01) )
	$"VBoxContainer/Mass/Edit/Mass LineEdit".text = str( snapped(mass, 0.001) )
	var mass_old_text = str( snapped(mass, 0.001) )
	$"VBoxContainer/Planet Type/OptionButton".selected = type
	
	_color_init()
	
	regex.compile("^[0-9.]*$") #Need to add .


# Change Numbers and RegEx
func _on_title_line_edit_text_changed(title_new_text):
	planet_name = $"VBoxContainer/Title/Title LineEdit".text
	get_node("../Label3D").text = planet_name
	get_node("../").cust_name = planet_name

func _on_radius_line_edit_text_changed(radius_new_text):
	if regex.search(radius_new_text):
		radius_old_text = str(radius_new_text)
		
		radius = float($"VBoxContainer/Radius/Edit/Radius LineEdit".text) *radius_scalar
		get_node("../").radius = radius
		get_node("../Label3D").scale = Vector3(1,1,1)
	else:
		var caret_pos = $"VBoxContainer/Radius/Edit/Radius LineEdit".get_caret_column()
		$"VBoxContainer/Radius/Edit/Radius LineEdit".text = radius_old_text
		$"VBoxContainer/Radius/Edit/Radius LineEdit".set_caret_column(caret_pos - 1)

func _on_orbit_line_edit_text_changed(orbit_new_text):
	if regex.search(orbit_new_text):
		orbit_old_text = str(orbit_new_text)
		
		orbit = float($"VBoxContainer/Orbit/Edit/Orbit LineEdit".text) *orbit_scalar
		get_node("../").orbital_distance = orbit
	else:
		var caret_pos = $"VBoxContainer/Orbit/Edit/Orbit LineEdit".get_caret_column()
		$"VBoxContainer/Orbit/Edit/Orbit LineEdit".text = orbit_old_text
		$"VBoxContainer/Orbit/Edit/Orbit LineEdit".set_caret_column(caret_pos - 1)

func _on_period_line_edit_text_changed(period_new_text):
	if regex.search(period_new_text):
		period_old_text = str(period_new_text)
		
		period = float($"VBoxContainer/Period/Edit/Period LineEdit".text)
		get_node("../").period = 1.0/ period
	else:
		var caret_pos = $"VBoxContainer/Period/Edit/Period LineEdit".get_caret_column()
		$"VBoxContainer/Period/Edit/Period LineEdit".text = period_old_text
		$"VBoxContainer/Period/Edit/Period LineEdit".set_caret_column(caret_pos - 1)

func _on_mass_line_edit_text_changed(mass_new_text):
	if regex.search(mass_new_text):
		mass_old_text = str(mass_new_text)
		
		mass = float($"VBoxContainer/Mass/Edit/Mass LineEdit".text)
		get_node("../").mass = mass
	else:
		var caret_pos = $"VBoxContainer/Mass/Edit/Mass LineEdit".get_caret_column()
		$"VBoxContainer/Mass/Edit/Mass LineEdit".text = mass_old_text
		$"VBoxContainer/Mass/Edit/Mass LineEdit".set_caret_column(caret_pos - 1)


# Colors
func _on_option_button_item_selected(index):
	if index != 5:
		$"VBoxContainer/Planet Type/CustomColor".hide()
		$ColorRect.size.y = 800
	if index == 0:
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(0.384, 0.384, 0.384, 1)
		get_node("../").type = 0
	elif index == 1:
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(0.365, 0.565, 0.169, 1)
		get_node("../").type = 1
	elif index == 2:
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(0.804, 0.804, 0.804, 1)
		get_node("../").type = 2
	elif index == 3:
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(0.754, 0.488, 0.177, 1)
		get_node("../").type = 3
	elif index == 4:
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(0.737, 0.804, 0.871, 1)
		get_node("../").type = 4
	elif index == 5:
		$"VBoxContainer/Planet Type/CustomColor".show()
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)
		$ColorRect.size.y = 1150
		get_node("../").type = 0

func _on_r_line_edit_text_changed(custom_color_r_new_text):
	if regex.search(custom_color_r_new_text) and int(custom_color_r_new_text) <=255:
		custom_color_r_old_text = str(custom_color_r_new_text)
		
		custom_color.x = int(custom_color_r_new_text)
		_update_custom_color()
	else:
		var caret_pos = $"VBoxContainer/Planet Type/CustomColor/R/R LineEdit".get_caret_column()
		$"VBoxContainer/Planet Type/CustomColor/R/R LineEdit".text = custom_color_r_old_text
		$"VBoxContainer/Planet Type/CustomColor/R/R LineEdit".set_caret_column(caret_pos - 1)

func _on_g_line_edit_text_changed(custom_color_g_new_text):
	if regex.search(custom_color_g_new_text) and int(custom_color_g_new_text) <=255:
		custom_color_g_old_text = str(custom_color_g_new_text)
		
		custom_color.y = int(custom_color_g_new_text)
		_update_custom_color()
	else:
		var caret_pos = $"VBoxContainer/Planet Type/CustomColor/G/G LineEdit".get_caret_column()
		$"VBoxContainer/Planet Type/CustomColor/G/G LineEdit".text = custom_color_g_old_text
		$"VBoxContainer/Planet Type/CustomColor/G/G LineEdit".set_caret_column(caret_pos - 1)

func _on_b_line_edit_text_changed(custom_color_b_new_text):
	if regex.search(custom_color_b_new_text) and int(custom_color_b_new_text) <=255:
		custom_color_b_old_text = str(custom_color_b_new_text)
		
		custom_color.z = int(custom_color_b_new_text)
		_update_custom_color()
	else:
		var caret_pos = $"VBoxContainer/Planet Type/CustomColor/B/B LineEdit".get_caret_column()
		$"VBoxContainer/Planet Type/CustomColor/B/B LineEdit".text = custom_color_b_old_text
		$"VBoxContainer/Planet Type/CustomColor/B/B LineEdit".set_caret_column(caret_pos - 1)

func _on_a_line_edit_text_changed(custom_color_a_new_text):
	if regex.search(custom_color_a_new_text) and int(custom_color_a_new_text) <=255:
		custom_color_a_old_text = str(custom_color_a_new_text)
		
		custom_color.w = int(custom_color_a_new_text)
		_update_custom_color()
	else:
		var caret_pos = $"VBoxContainer/Planet Type/CustomColor/A/A LineEdit".get_caret_column()
		$"VBoxContainer/Planet Type/CustomColor/A/A LineEdit".text = custom_color_a_old_text
		$"VBoxContainer/Planet Type/CustomColor/A/A LineEdit".set_caret_column(caret_pos - 1)

func _update_custom_color():
	custom_color_X = custom_color/255
	get_node("../").cust_color_X = custom_color_X
	get_node("../MeshInstance3D").mesh.material.albedo_color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)
	$"VBoxContainer/Planet Type/CustomColor/ColorRect".color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)


# Release Focus
func _on_line_edit_gui_input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		Main.editing = true
		Camera.block_movement = true
		await get_tree().create_timer(.1).timeout
		Main.editing = false


func _on_button_pressed():
	hide()

func _color_init():
	custom_color = custom_color_X*255
	get_node("../MeshInstance3D").mesh.material.albedo_color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)
	$"VBoxContainer/Planet Type/CustomColor/ColorRect".color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)
	$"VBoxContainer/Planet Type/CustomColor/R/R LineEdit".text = str(custom_color.x)
	$"VBoxContainer/Planet Type/CustomColor/G/G LineEdit".text = str(custom_color.y)
	$"VBoxContainer/Planet Type/CustomColor/B/B LineEdit".text = str(custom_color.z)
	$"VBoxContainer/Planet Type/CustomColor/A/A LineEdit".text = str(custom_color.w)
