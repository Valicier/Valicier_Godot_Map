extends Node2D

var syst_zoom = 20 #10 for Color Square
var pulsar_base_zoom = 0.15
var rift_base_zoom = 0.1
var other_base_zoom = 0.15


func _ready():
	_on_camera_zooming()
	_gate_radii()


func _on_camera_zooming():
	# Update cam_zoom
	var cam_zoom = get_node("Camera").zoom
	
	# Scale Systems
	for i in get_node("Systems").get_children():
		if cam_zoom >= Vector2(1, 1):
			i.scale = Vector2(syst_zoom/cam_zoom.x, syst_zoom/cam_zoom.y)
		elif cam_zoom < Vector2(1, 1):
			i.scale = Vector2(1, 1)
	
	# Scale Pulsars
	for i in get_node("Pulsars").get_children():
		if cam_zoom >= Vector2(1, 1):
			i.scale = Vector2(pulsar_base_zoom/cam_zoom.x, pulsar_base_zoom/cam_zoom.y)
		elif cam_zoom < Vector2(1, 1):
			i.scale = Vector2(pulsar_base_zoom, pulsar_base_zoom)
	
	# Scale Rifts
	for i in get_node("Rifts").get_children():
		if cam_zoom >= Vector2(1, 1):
			i.scale = Vector2(rift_base_zoom/cam_zoom.x, rift_base_zoom/cam_zoom.y)
		elif cam_zoom < Vector2(1, 1):
			i.scale = Vector2(1, 1)
	
	# Scale Other
	for i in get_node("Other").get_children():
		if cam_zoom >= Vector2(1, 1):
			i.scale = Vector2(other_base_zoom/cam_zoom.x, other_base_zoom/cam_zoom.y)
		elif cam_zoom < Vector2(1, 1):
			i.scale = Vector2(1, 1)
	
	# Change Map
	if cam_zoom.x > 1.25:
		$"MapThick".visible = false
		$"Map".visible = true
	else:
		$"MapThick".visible = true
		$"Map".visible = false
	
	# Scale Tooltips
	if cam_zoom >= Vector2(1, 1):
		$"Tooltips".scale = Vector2(1/cam_zoom.x, 1/cam_zoom.y)
	elif cam_zoom < Vector2(1, 1):
		$"Tooltips".scale = Vector2(1, 1)


# Draw Gate Radii
func _gate_radii():
	var types = [$Systems, $Rifts, $Other]
	var gate_radius = preload("res://Code/gate_radius.tscn")
	var parent_offset = [Vector2(-syst_zoom/2, -syst_zoom/2), Vector2(rift_base_zoom, rift_base_zoom), Vector2(other_base_zoom, other_base_zoom)]
	var iterations = 0
	
	for i in types:
		if i.get_global_position() != Vector2(0,0):
			parent_offset[iterations] = parent_offset[iterations] *i.get_global_position()
		for j in i.get_children():
			var parent_pos = j.get_global_position()
			var parent_name = j.get_name()
			if parent_pos != Vector2(0,0):
				var new_gate_radius = gate_radius.instantiate()
				new_gate_radius.global_position = parent_pos -parent_offset[iterations]
				new_gate_radius.name = parent_name
				new_gate_radius.visible = false
				$"Gate Radii".add_child(new_gate_radius)
		iterations += 1

