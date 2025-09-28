extends Node2D

var button_type = null

func _on_start_pressed():
	button_type = "start"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


func _on_how_to_pressed():
	button_type = "how to"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")

func _on_fade_timer_timeout():
	if button_type=="start":
		get_tree().change_scene_to_file("res://scenes/game.tscn")
		
	elif button_type=="how to":
		get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")
