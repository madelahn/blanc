extends ColorRect

signal fade_finished

func fade_in():
	$AnimationPlayer5.play("BlackFade")
	
func _on_AnimationPlayer5_animation_finished(animation):
	emit_signal("fade_finished")
