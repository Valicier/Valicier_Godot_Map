extends StaticBody3D

@export var radius = 696300
@export var orbital_distance = 0
@export var period = 0
@export var mass = 5.972
@export var type = 2
@export var cust_name = "Sun"
@export var cust_color_X = Vector4(1, 1, 1, 1)
@export var cust_light_color_X = Vector4(1, 1, 1, 1)

@onready var premade = get_node("../../").premade
@onready var sun_radius_scalar = get_node("../../").sun_radius_scalar
@onready var sun_orbit_scalar = get_node("../../").sun_orbit_scalar

# Planet name needs @onready so is found in edit_screen

func _ready():
	$MeshInstance3D.scale = Vector3(radius, radius, radius)
	
	#Get Colors
	cust_color_X = get_node("Sun Edit Screen").custom_color_X
	cust_light_color_X = get_node("Sun Edit Screen").custom_light_color_X
	
	# Scale variables
	radius = radius * sun_radius_scalar
	orbital_distance = orbital_distance * sun_orbit_scalar

func _process(delta):
	$MeshInstance3D.scale = Vector3(radius, radius, radius)

func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true and premade == false:
			if $"Sun Edit Screen".visible == false:
				for i in get_tree().get_nodes_in_group("edit_screen"):
					i.hide()
				$"Sun Edit Screen".show()
			else:
				$"Sun Edit Screen".hide()
