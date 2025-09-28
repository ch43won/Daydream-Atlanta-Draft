extends Area2D

var checkpoint_manager

func _ready() -> void:
	checkpoint_manager = get_parent().get_node("CheckpointManager")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player1"):
		kill_player(body)

func kill_player(player_node: Node2D) -> void:
	player_node.position = checkpoint_manager.get_checkpoint()
