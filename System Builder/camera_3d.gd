extends Camera3D

# Camera Movment
var speed = 10.0
var min_speed = 0.0
var max_speed = 1000.0

# Camera Rotation
var rotating = false
var last_mouse_pos
var next_mouse_pos

var block_movement = true


func _process(delta):
	if block_movement == false:
		# Camera Movment
		var direction = Vector3(
			float(Input.is_action_pressed("Camera Right")) - float(Input.is_action_pressed("Camera Left")),
			float(Input.is_action_pressed("Camera Up")) - float(Input.is_action_pressed("Camera Down")),
			float(Input.is_action_pressed("Camera Back")) - float(Input.is_action_pressed("Camera Forward"))
		).normalized()
		#print(direction)
		
		translate(direction * speed * delta)
		
		# Camera Rotation
		if Input.is_action_just_pressed("Camera Drag"):
			rotating = true
			last_mouse_pos = get_viewport().get_mouse_position()
		
		if Input.is_action_just_released("Camera Drag"):
			rotating = false
		
		if rotating == true:
			next_mouse_pos = get_viewport().get_mouse_position()
			rotation.y = (next_mouse_pos.x - last_mouse_pos.x) * delta
			rotation.x = (next_mouse_pos.y - last_mouse_pos.y) * delta * -1
	#print(rotation)
