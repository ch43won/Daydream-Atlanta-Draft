extends Area2D

# Replace these with the actual paths to your scenes in the project folder!
const PLAYER1_ENDING_PATH = "res://scenes/player_1_ending.tscn"
const PLAYER2_ENDING_PATH = "res://scenes/player_2_ending.tscn"

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player2"):  # Player 1 group
		print("Player 1 reached the train — loading Player 1 ending.")
		get_tree().change_scene_to_file(PLAYER1_ENDING_PATH)
	elif body.is_in_group("player3"):  # Player 2 group
		print("Player 2 reached the train — loading Player 2 ending.")
		get_tree().change_scene_to_file(PLAYER2_ENDING_PATH)
