extends Area2D

var checkpoint_manager

func _ready() -> void:
	checkpoint_manager = get_parent().get_parent().get_node("CheckpointManager")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player1"):
		checkpoint_manager.set_checkpoint($RespawnPoint.global_position)
