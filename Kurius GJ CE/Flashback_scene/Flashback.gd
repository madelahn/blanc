extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$bg_anim.play("bg_anim")
	$transition.play("fade_out")
	$flashback_sound.play()
	
	if $flashback_sound.playing:
			yield($flashback_sound, "finished")
	$contemplation.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
