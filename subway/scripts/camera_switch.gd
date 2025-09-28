extends Node

@export var camera1_path: NodePath
@export var camera2_path: NodePath

var camera1: Camera2D
var camera2: Camera2D

func _ready():
	camera1 = get_node(camera1_path)
	camera2 = get_node(camera2_path)

	# Start with camera1 enabled
	_activate_camera(camera1)

func _process(delta):
	if Input.is_action_just_pressed("switch_to_1"):
		_activate_camera(camera1)
	elif Input.is_action_just_pressed("switch_to_2"):
		_activate_camera(camera2)

func _activate_camera(active_camera: Camera2D):
	camera1.enabled = false
	camera2.enabled = false
	active_camera.enabled = true
