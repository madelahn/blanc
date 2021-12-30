extends Control

func _ready():
	$anim_clouds.play("Clouds")
	$anim_trees.play("Trees 2")
	$anim_mountains.play("mountains")
	$anim_snow.play("Flakes")


func _on_StartButton_pressed():
	$ButtonClickedSound.play()
	$transition.play("fade")
	$fade_bgm.play("fade_out")
	
	if $ButtonClickedSound.playing:
		yield($ButtonClickedSound, "finished")
		
	get_tree().change_scene("res://cutscenes/Opening_scene/Opening_scene.tscn")
	