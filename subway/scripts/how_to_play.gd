extends Node2D

var button_type = null

@onready var back_button = $back
@onready var fade_timer = $Fade_transition/Fade_timer
@onready var animation_player = $Fade_transition/AnimationPlayer

func _ready() -> void:
	back_button.pressed.connect(_on_back_pressed)
	fade_timer.timeout.connect(_on_fade_timer_timeout)
	$Fade_transition.visible = false  # hide fade at start

func _on_back_pressed() -> void:
	button_type = "back"
	$Fade_transition.visible = true
	animation_player.play("fade_in")
	fade_timer.start()

func _on_fade_timer_timeout() -> void:
	if button_type == "back":
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
