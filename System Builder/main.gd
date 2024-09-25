extends Node3D

var time = 0
var years = 0.0
var slower = 0.1
var time_speed = 0

var camera_base_pos = Vector3(0, 20, 0)
var camera_base_rot = Vector3(-PI/2, 0, 0)

var editing = false
var premade = false

@onready var cust_seed = Global.cust_seed
var planet_scene = preload("res://System Builder/planets/planet1.tscn")
var sun_scene = preload("res://System Builder/sun.tscn")
var rng = RandomNumberGenerator.new()

# Scalars
var radius_scalar = 1/6371.0
var orbit_scalar = 1/149.6 *12.0
var sun_radius_scalar = 1/116050.0
var sun_orbit_scalar = 1/1496 *10.0

var seg = 9

# Time for 1 rev(default) = 2*PI

func _ready():
	
	if cust_seed != []:
		_load_seed()
	
	# Needed this or sun affected by System Light
	await get_tree().create_timer(.11).timeout
	$"System Light".show()
	
	if premade == true:
		$"GUI/VBoxContainer/Add Planet".hide()


func _physics_process(delta):
	# Move Planets
	time += delta * slower * time_speed
	for i in $Planets.get_children():
		var angle = i.period * time
		var rot = Vector3(cos(angle), 0, sin(angle))
		i.position = rot * i.orbital_distance
	
	# Time Label
	var years = time/(2*PI)
	$"GUI/VBoxContainer/Time Label".text = str(years).pad_decimals(2) + " ESY"
	
	time_speed = float($"GUI/VBoxContainer/Speed Control/Speed Edit".text)
	
	# Release Focus
	_line_edits_release_focus()


func _line_edits_release_focus():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and editing == false:
		#getallnodes(get_node("."))
		for i in get_tree().get_nodes_in_group("line_edits"):
				i.release_focus()
		$Camera3D.block_movement = false


func _on_speed_edit_gui_input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		editing = true
		$Camera3D.block_movement = true
		await get_tree().create_timer(.1).timeout
		editing = false


# Buttons
func _on_speed_up_pressed():
	time_speed += 1
	$"GUI/VBoxContainer/Speed Control/Speed Edit".text = str(time_speed)

func _on_speed_down_pressed():
	time_speed -= 1
	$"GUI/VBoxContainer/Speed Control/Speed Edit".text = str(time_speed)

func _on_add_planet_pressed():
	var planet_count = $Planets.get_child_count()
	var new_planet = planet_scene.instantiate()
	new_planet.cust_name = "Planet " + str(planet_count +1)
	new_planet.radius = rng.randf_range(3000.0, 20000.0)
	new_planet.orbital_distance = rng.randf_range(75.0, 400.0)
	new_planet.period = 1/ rng.randf_range(0.01, 1.2)
	if new_planet.period < 1.0:
		new_planet.period = 1/ rng.randf_range(1, 5)
	new_planet.mass = rng.randf_range(0.5, 10.0)
	new_planet.type = rng.randi_range(0, 4)
	$Planets.add_child(new_planet)

func _on_camera_reset_pressed():
	$Camera3D.position = camera_base_pos
	$Camera3D.rotation = camera_base_rot

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Code/Map.tscn")

func _on_export_pressed():
	var cust_seed_out = []
	for i in $Suns.get_children():
		cust_seed_out.append( "Sun")
		cust_seed_out.append( i.radius /sun_radius_scalar )
		cust_seed_out.append( i.orbital_distance /sun_orbit_scalar)
		cust_seed_out.append( i.period )
		cust_seed_out.append( i.mass )
		cust_seed_out.append( i.type )
		cust_seed_out.append( str( i.cust_name ) )
		cust_seed_out.append( "Vector4" +str(i.cust_color_X) )
		cust_seed_out.append( "Vector4" +str(i.cust_light_color_X) )
	
	for i in $Planets.get_children():
		cust_seed_out.append( "Planet")
		cust_seed_out.append( i.radius /radius_scalar )
		cust_seed_out.append( i.orbital_distance /orbit_scalar)
		cust_seed_out.append( i.period )
		cust_seed_out.append( i.mass )
		cust_seed_out.append( i.type )
		cust_seed_out.append( str( i.cust_name ) )
		cust_seed_out.append( "Vector4" +str(i.cust_color_X) )
		cust_seed_out.append( 0 )
	
	for i in cust_seed_out.size():
		if typeof(cust_seed_out[i]) != TYPE_STRING and typeof(cust_seed_out[i]) != TYPE_VECTOR4:
			if is_nan(cust_seed_out[i]) == true:
				cust_seed_out[i] = 0
	print(cust_seed_out)
	
	DisplayServer.clipboard_set(str(cust_seed_out))

func _on_import_pressed():
	$Import.show()
	$Camera3D.block_movement = true

func _on_import_imported():
	_load_seed()



# Creates system based on custom seed
func _load_seed():
	for i in $Planets.get_children():
		$Planets.remove_child(i)
		i.queue_free()
	for i in $Suns.get_children():
		$Suns.remove_child(i)
		i.queue_free()
	
	var seeded_planets = floor( cust_seed.size()/seg )
	for i in range(0, seeded_planets):
		if cust_seed[i*seg] == "Sun":
			var new_sun = sun_scene.instantiate()
			new_sun.radius = cust_seed[i*seg +1]
			new_sun.orbital_distance = cust_seed[i*seg +2]
			new_sun.period = cust_seed[i*seg +3]
			new_sun.mass = cust_seed[i*seg +4]
			new_sun.type = cust_seed[i*seg +5]
			if cust_seed[i*seg +5] == 5:
				new_sun.cust_color_X = str_to_var( cust_seed[i*seg + 7] )
				new_sun.cust_light_color_X = str_to_var( cust_seed[i*seg + 8] )
			new_sun.cust_name = str(cust_seed[i*seg +6])
			$Suns.add_child(new_sun)
		elif cust_seed[i*seg] == "Planet":
			var new_planet = planet_scene.instantiate()
			new_planet.radius = cust_seed[i*seg +1]
			new_planet.orbital_distance = cust_seed[i*seg +2]
			new_planet.period = cust_seed[i*seg +3]
			new_planet.mass = cust_seed[i*seg +4]
			new_planet.type = cust_seed[i*seg +5]
			if cust_seed[i*seg +5] == 5:
				new_planet.custom_color_X = str_to_var( cust_seed[i*seg + 7] )
			new_planet.cust_name = str(cust_seed[i*seg +6])
			$Planets.add_child(new_planet)



#func getallnodes(node):
#	for N in node.get_children():
#		if N.get_child_count() > 0:
#			getallnodes(N)
#		else:
#			if N is LineEdit:
#				N.release_focus()
