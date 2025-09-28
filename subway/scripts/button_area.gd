extends Area2D

@export var controlled_platform: NodePath

var platform_node: Node = null
var players_on_button = 0

@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	if controlled_platform != null:
		platform_node = get_node(controlled_platform)
	else:
		push_warning("Button has no platform assigned!")
	animated_sprite.play("default")

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player1"):
		players_on_button += 1
		animated_sprite.play("pressed")
		if platform_node:
			platform_node.start_moving()

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player1"):
		players_on_button = max(players_on_button - 1, 0)
		if players_on_button == 0:
			animated_sprite.play("default")
			if platform_node:
				platform_node.stop_moving()
