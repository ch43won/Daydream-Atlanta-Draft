extends AnimatableBody2D

@export var move_direction: Vector2 = Vector2.UP
@export var move_distance: float = 100.0
@export var move_speed: float = 100.0

var original_position: Vector2
var target_position: Vector2
var moving_to_target = false
var returning = false

func _ready() -> void:
	original_position = global_position
	target_position = original_position + (move_direction.normalized() * move_distance)

func _process(delta: float) -> void:
	if moving_to_target:
		global_position = global_position.move_toward(target_position, move_speed * delta)
		if global_position.distance_to(target_position) < 1.0:
			moving_to_target = false

	elif returning:
		global_position = global_position.move_toward(original_position, move_speed * delta)
		if global_position.distance_to(original_position) < 1.0:
			returning = false

func start_moving():
	moving_to_target = true
	returning = false

func stop_moving():
	moving_to_target = false
	returning = true
