extends Control


func _ready():
	$dialogue/gran.stream_paused = true
	$dialogue/textbox.visible = false
	
	get_tree().get_root().set_disable_input(true)
	
	$bg_anim.play("bg_anim")
	$transition.play("fade_out")
	$flashback_sound.play()
	
	if $flashback_sound.playing:
		yield($flashback_sound, "finished")
	$contemplation.play()

	$start_dialogue.set_wait_time(1)
	$start_dialogue.start()


func start_dialogue():
	get_tree().get_root().set_disable_input(false)
	$dialogue/gran.stream_paused = false
	$dialogue/textbox.visible = true


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed and $dialogue/textbox.visible == false:
				$dialogue/textbox.visible = false
				$start_levels.start()


func start_levels():
	$transition2.play("fade_out")
	yield($transition2, "animation_finished")
	get_tree().change_scene("res://levels/Level1.tscn")
