extends Control


func _ready():
	$dialogue/player.stream_paused = true
	get_tree().get_root().set_disable_input(true)
	$dialogue/textbox.visible = false
	
	$blanc.play()
	$anim_snow.play("Flakes")
	$tim_wind.play("tim_wind2")
	$transition.play("fade_out")
	yield($transition, "animation_finished")
	
	$dialogue/player.stream_paused = false
	$dialogue/textbox.visible = true
	get_tree().get_root().set_disable_input(false)


# To be played after the end of the dialogue.
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed and $dialogue/textbox.visible == false:
				$Timer.set_wait_time(1.5)
				$Timer.start()


func start_pan():
	get_tree().get_root().set_disable_input(true)
	$bg_pan.play("bg_pan")
	$bg_pan.queue("anim_blanc")
	yield($bg_pan, "animation_finished")
	
	$end.set_wait_time(10)
	$end.start()
	fade()


func fade():
	$fade_bgm.play("fade_out")
	$transition2.play("fade")
	yield($transition2, "animation_finished")
	
	$go_menu.set_wait_time(2)
	$go_menu.start()


func go_menu():
	get_tree().get_root().set_disable_input(false)
	get_tree().change_scene("res://Menu.tscn")
