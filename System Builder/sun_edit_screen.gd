extends Control

@onready var radius = get_node("../").radius
@onready var orbit = get_node("../").orbital_distance
@onready var period = get_node("../").period
@onready var mass = get_node("../").mass
@onready var type = get_node("../").type
@onready var planet_name = get_node("../").cust_name
@onready var custom_color_X = get_node("../").cust_color_X
@onready var custom_light_color_X = get_node("../").cust_light_color_X
var custom_color = Vector4(255, 255, 255, 255)
var custom_light_color = Vector4(255, 255, 255, 255)

@onready var Main = get_node("../../../")
@onready var Camera = get_node("../../../Camera3D")
@onready var editing = Main.editing

@onready var sun_radius_scalar = get_node("../../../").sun_radius_scalar
@onready var sun_orbit_scalar = get_node("../../../").sun_orbit_scalar

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

var color_mode = "Mesh"

func _process(delta):
	print(custom_color)

func _ready():
	$"VBoxContainer/Title/Title LineEdit".text = planet_name
	#get_node("../Label3D").text = planet_name
	var title_old_text = planet_name
	$"VBoxContainer/Radius/Edit/Radius LineEdit".text = str(radius)
	var radius_old_text = str(radius)
	$"VBoxContainer/Orbit/Edit/Orbit LineEdit".text = str(orbit)
	var orbit_old_text = str(orbit)
	$"VBoxContainer/Period/Edit/Period LineEdit".text = str(period)
	var period_old_text = str(period)
	$"VBoxContainer/Mass/Edit/Mass LineEdit".text = str(mass)
	var mass_old_text = str(mass)
	$"VBoxContainer/Planet Type/OptionButton".selected = type
	_on_option_button_item_selected(type)
	
	_color_init()
	
	get_node("../Sun Light").omni_range = radius
	
	regex.compile("^[0-9.]*$") #Need to add .


# Change Numbers and RegEx
func _on_title_line_edit_text_changed(title_new_text):
	planet_name = $"VBoxContainer/Title/Title LineEdit".text
	#get_node("../Label3D").text = planet_name
	get_node("../").cust_name = planet_name

func _on_radius_line_edit_text_changed(radius_new_text):
	if regex.search(radius_new_text):
		radius_old_text = str(radius_new_text)
		
		radius = float($"VBoxContainer/Radius/Edit/Radius LineEdit".text) *sun_radius_scalar
		get_node("../").radius = radius
		
		get_node("../Sun Light").omni_range = radius
		get_node("../../../System Light").hide()
		get_node("../../../System Light").show()
	else:
		var caret_pos = $"VBoxContainer/Radius/Edit/Radius LineEdit".get_caret_column()
		$"VBoxContainer/Radius/Edit/Radius LineEdit".text = radius_old_text
		$"VBoxContainer/Radius/Edit/Radius LineEdit".set_caret_column(caret_pos - 1)

func _on_orbit_line_edit_text_changed(orbit_new_text):
	if regex.search(orbit_new_text):
		orbit_old_text = str(orbit_new_text)
		
		orbit = float($"VBoxContainer/Orbit/Edit/Orbit LineEdit".text) *sun_orbit_scalar
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
		$ColorRect.size.y = 500
	if index == 0: # Red
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(0.776, 0.067, 0.09, 1)
		get_node("../Sun Light").light_color = Color(1, 0.278, 0.306)
		get_node("../").type = 0
	elif index == 1: # Orange
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(0.859, 0.455, 0, 1)
		get_node("../Sun Light").light_color = Color(1, 1, 0)
		get_node("../").type = 1
	elif index == 2: # Yellow
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(1, 1, 0, 1)
		get_node("../Sun Light").light_color = Color(1, 0.729, 0.22, 1)
		get_node("../").type = 2
	elif index == 3: # Blue
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(0.165, 0.306, 1, 1)
		get_node("../Sun Light").light_color = Color(0.22, 0.349, 1)
		get_node("../").type = 3
	elif index == 4: # White
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(1, 1, 1, 1)
		get_node("../Sun Light").light_color = Color(1, 1, 1)
		get_node("../").type = 4
	elif index == 5: # Custom
		$"VBoxContainer/Planet Type/CustomColor".show()
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)
		$ColorRect.size.y = 950
		get_node("../").type = 5

func _on_button_pressed():
	if color_mode == "Mesh":
		color_mode = "Light"
		$"VBoxContainer/Planet Type/CustomColor/RichTextLabel".text = "[center]Custom Light Color[/center]"
		$"VBoxContainer/Planet Type/CustomColor/Button".text = "Mesh Color"
		$"VBoxContainer/Planet Type/CustomColor/ColorRect".color = Color(custom_light_color_X.x, custom_light_color_X.y, custom_light_color_X.z, custom_light_color_X.w)
		$"VBoxContainer/Planet Type/CustomColor/R/R LineEdit".text = str(custom_light_color.x)
		$"VBoxContainer/Planet Type/CustomColor/G/G LineEdit".text = str(custom_light_color.y)
		$"VBoxContainer/Planet Type/CustomColor/B/B LineEdit".text = str(custom_light_color.z)
		$"VBoxContainer/Planet Type/CustomColor/A/A LineEdit".text = str(custom_light_color.w)
		
	elif color_mode == "Light":
		color_mode = "Mesh"
		$"VBoxContainer/Planet Type/CustomColor/RichTextLabel".text = "[center]Custom Mesh Color[/center]"
		$"VBoxContainer/Planet Type/CustomColor/Button".text = "Light Color"
		$"VBoxContainer/Planet Type/CustomColor/ColorRect".color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)
		$"VBoxContainer/Planet Type/CustomColor/R/R LineEdit".text = str(custom_color.x)
		$"VBoxContainer/Planet Type/CustomColor/G/G LineEdit".text = str(custom_color.y)
		$"VBoxContainer/Planet Type/CustomColor/B/B LineEdit".text = str(custom_color.z)
		$"VBoxContainer/Planet Type/CustomColor/A/A LineEdit".text = str(custom_color.w)

func _on_r_line_edit_text_changed(custom_color_r_new_text):
	if regex.search(custom_color_r_new_text) and int(custom_color_r_new_text) <=255:
		custom_color_r_old_text = str(custom_color_r_new_text)
		
		if color_mode == "Mesh":
			custom_color.x = int(custom_color_r_new_text)
		elif color_mode == "Light":
			custom_light_color.x = int(custom_color_r_new_text)
		_update_custom_color()
	else:
		var caret_pos = $"VBoxContainer/Planet Type/CustomColor/R/R LineEdit".get_caret_column()
		$"VBoxContainer/Planet Type/CustomColor/R/R LineEdit".text = custom_color_r_old_text
		$"VBoxContainer/Planet Type/CustomColor/R/R LineEdit".set_caret_column(caret_pos - 1)

func _on_g_line_edit_text_changed(custom_color_g_new_text):
	if regex.search(custom_color_g_new_text) and int(custom_color_g_new_text) <=255:
		custom_color_g_old_text = str(custom_color_g_new_text)
		
		if color_mode == "Mesh":
			custom_color.y = int(custom_color_g_new_text)
		elif color_mode == "Light":
			custom_light_color.y = int(custom_color_g_new_text)
		_update_custom_color()
	else:
		var caret_pos = $"VBoxContainer/Planet Type/CustomColor/G/G LineEdit".get_caret_column()
		$"VBoxContainer/Planet Type/CustomColor/G/G LineEdit".text = custom_color_g_old_text
		$"VBoxContainer/Planet Type/CustomColor/G/G LineEdit".set_caret_column(caret_pos - 1)

func _on_b_line_edit_text_changed(custom_color_b_new_text):
	if regex.search(custom_color_b_new_text) and int(custom_color_b_new_text) <=255:
		custom_color_b_old_text = str(custom_color_b_new_text)
		
		if color_mode == "Mesh":
			custom_color.z = int(custom_color_b_new_text)
		elif color_mode == "Light":
			custom_light_color.z = int(custom_color_b_new_text)
		_update_custom_color()
	else:
		var caret_pos = $"VBoxContainer/Planet Type/CustomColor/B/B LineEdit".get_caret_column()
		$"VBoxContainer/Planet Type/CustomColor/B/B LineEdit".text = custom_color_b_old_text
		$"VBoxContainer/Planet Type/CustomColor/B/B LineEdit".set_caret_column(caret_pos - 1)

func _on_a_line_edit_text_changed(custom_color_a_new_text):
	if regex.search(custom_color_a_new_text) and int(custom_color_a_new_text) <=255:
		custom_color_a_old_text = str(custom_color_a_new_text)
		
		if color_mode == "Mesh":
			custom_color.w = int(custom_color_a_new_text)
		elif color_mode == "Light":
			custom_light_color.w = int(custom_color_a_new_text)
		_update_custom_color()
	else:
		var caret_pos = $"VBoxContainer/Planet Type/CustomColor/A/A LineEdit".get_caret_column()
		$"VBoxContainer/Planet Type/CustomColor/A/A LineEdit".text = custom_color_a_old_text
		$"VBoxContainer/Planet Type/CustomColor/A/A LineEdit".set_caret_column(caret_pos - 1)

func _update_custom_color():
	if color_mode == "Mesh":
		custom_color_X = custom_color/255
		get_node("../").cust_color_X = custom_color_X
		get_node("../MeshInstance3D").mesh.material.albedo_color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)
		$"VBoxContainer/Planet Type/CustomColor/ColorRect".color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)
	elif color_mode == "Light":
		custom_light_color_X = custom_light_color/255
		get_node("../").cust_light_color_X = custom_light_color_X
		get_node("../Sun Light").light_color = Color(custom_light_color_X.x, custom_light_color_X.y, custom_light_color_X.z, custom_light_color_X.w)
		$"VBoxContainer/Planet Type/CustomColor/ColorRect".color = Color(custom_light_color_X.x, custom_light_color_X.y, custom_light_color_X.z, custom_light_color_X.w)

func _color_init():
	custom_color = custom_color_X*255
	custom_light_color = custom_light_color_X*255
	get_node("../MeshInstance3D").mesh.material.albedo_color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)
	get_node("../Sun Light").light_color = Color(custom_light_color_X.x, custom_light_color_X.y, custom_light_color_X.z, custom_light_color_X.w)
	$"VBoxContainer/Planet Type/CustomColor/ColorRect".color = Color(custom_color_X.x, custom_color_X.y, custom_color_X.z, custom_color_X.w)
	$"VBoxContainer/Planet Type/CustomColor/R/R LineEdit".text = str(custom_color.x)
	$"VBoxContainer/Planet Type/CustomColor/G/G LineEdit".text = str(custom_color.y)
	$"VBoxContainer/Planet Type/CustomColor/B/B LineEdit".text = str(custom_color.z)
	$"VBoxContainer/Planet Type/CustomColor/A/A LineEdit".text = str(custom_color.w)

# Release Focus
func _on_line_edit_gui_input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		Main.editing = true
		Camera.block_movement = true
		await get_tree().create_timer(.1).timeout
		Main.editing = false
