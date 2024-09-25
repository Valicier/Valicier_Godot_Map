extends Camera2D

var mouse_start_pos
var screen_start_pos
var zoom_speed = 0.25
var zoom_speed_fast = 1
var zoom_min = 1

var dragging = false

signal zooming

# Zoom
func _process(delta):
	# Zoom
	if Input.is_action_just_pressed("Zoom In"):
		if Input.is_key_pressed(KEY_CTRL):
			zoom = zoom + Vector2(zoom_speed_fast, zoom_speed_fast)
		else:
			zoom = zoom + Vector2(zoom_speed, zoom_speed)
		emit_signal("zooming")
	if Input.is_action_just_pressed("Zoom Out") and zoom > Vector2(zoom_min, zoom_min):
		if Input.is_key_pressed(KEY_CTRL):
			zoom = zoom - Vector2(zoom_speed_fast, zoom_speed_fast)
		else:
			zoom = zoom - Vector2(zoom_speed, zoom_speed)
		emit_signal("zooming")
	# Zoom Restriction
	if zoom < Vector2(zoom_min, zoom_min):
		zoom = Vector2(zoom_min, zoom_min)
	if zoom > Vector2(10,10):
		zoom = Vector2(10,10)
	#print(zoom)

# Drag Screen
func _input(event):
	# Drag
	if event.is_action("drag"):
		if event.is_pressed():
			mouse_start_pos = event.position
			screen_start_pos = position
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		position = (mouse_start_pos - event.position) * 1/zoom + screen_start_pos
