extends CharacterBody3D


const SPEED = 15.0

func _physics_process(delta):
	var input_horizontal = Input.get_vector("Camera Left", "Camera Right", "Camera Forward", "Camera Back")
	var input_vertical = Input.get_vector("Camera Down", "Camera Up", "Camera Down", "Camera UP")
	var direction = Vector3(input_horizontal.x, input_vertical.x, input_horizontal.y).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
