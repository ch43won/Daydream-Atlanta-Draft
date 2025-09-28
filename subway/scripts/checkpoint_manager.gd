extends Node

var last_location: Vector2

func _ready() -> void:
	# Initialize with one of the players' positions at start
	var player = get_parent().get_node("player1")
	last_location = player.global_position

func set_checkpoint(position: Vector2) -> void:
	last_location = position

func get_checkpoint() -> Vector2:
	return last_location
