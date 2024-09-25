extends StaticBody3D

@export var radius = 6371.0
@export var orbital_distance = 149.6
@export var period = 1.0
@export var mass = 5.972
@export var type = 0
@export var cust_name = "Planet 1"
@export var cust_color_X = Vector4(1, 1, 1, 1)

@onready var premade = get_node("../../").premade
@onready var radius_scalar = get_node("../../").radius_scalar
@onready var orbit_scalar = get_node("../../").orbit_scalar

# Planet name needs @onready so is found in edit_screen

func _ready():
	$".".name = cust_name
	$MeshInstance3D.scale = Vector3(radius, radius, radius)
	$Label3D.position = radius * Vector3(0, 0, .75)
	
	#Get Color
	cust_color_X = get_node("Edit Screen").custom_color_X
	
	# Scale variables
	radius = radius * radius_scalar
	orbital_distance = orbital_distance * orbit_scalar

func _process(delta):
	$MeshInstance3D.scale = Vector3(radius, radius, radius)
	$Label3D.position = radius * Vector3(0, 0, .75)
	
	$Orbit.mesh.outer_radius = orbital_distance + 0.05
	$Orbit.mesh.inner_radius = orbital_distance - 0.05

func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true and premade == false:
			if $"Edit Screen".visible == false:
				for i in get_tree().get_nodes_in_group("edit_screen"):
					i.hide()
				$"Edit Screen".show()
			else:
				$"Edit Screen".hide()
