extends Control


func _ready():
	$dialogue/player.stream_paused = true
	$dialogue/textbox.visible = false

	get_tree().get_root().set_disable_input(true)

	$contemplation.play()
	$anim_snow.play("Flakes")
	$bg_pan.play("bg_pan")
	$tim_wind.play("tim_wind_2")
	$transition.play("fade_out")
	
	$Timer.set_wait_time(12)
	$Timer.start()

func _on_Timer_timeout():
	get_tree().get_root().set_disable_input(false)
	$dialogue/player.stream_paused = false
	$dialogue/textbox.visible = true


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed and $dialogue/textbox.visible == false:
				$change_scene.start()


func change_scene():
	$transition.play("fade_in")
	get_tree().change_scene("res://levels/Level1.tscn")
