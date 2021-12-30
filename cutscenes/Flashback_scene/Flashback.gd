extends Control

func _ready():
	$bg_anim.play("bg_anim")
	$transition.play("fade_out")
	$flashback_sound.play()
	
	if $flashback_sound.playing:
		yield($flashback_sound, "finished")
	$contemplation.play()

func start_dialogue():
	pass # Replace with function body.
