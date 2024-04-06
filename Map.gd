extends Node2D

var syst_zoom = 20 #10 for Color Square
var pulsar_base_zoom = 0.15
@onready var cam_zoom = get_node("Camera").zoom

func _process(delta):
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
