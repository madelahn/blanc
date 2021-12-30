extends Control

func _ready():
	$anim_clouds.play("Clouds")
	$anim_trees.play("Trees 2")
	$anim_mountains.play("mountains")
	$anim_snow.play("Flakes")


func _on_StartButton_pressed():
	$StartSound.play()
	$transition.play("fade")
	$fade_bgm.play("fade_out")
	
	if $StartSound.playing:
		yield($StartSound, "finished")
		
	get_tree().change_scene("res://cutscenes/Opening_scene/Opening_scene.tscn")
	
func _on_AboutButton_pressed():
	$CreditsSound.play()
	$transition.play("fade")
	$bg_credits.visible = true
	$CreditsHbox.visible = true
	$CreditsHbox/BackButton.visible = true
	$CreditsHbox/BackButtonText.visible = true
	$CreditsText.visible = true
	$transition.play("fade_out")


func _on_BackButton_pressed():
	$CreditsSound.play()
	$transition.play("fade")
	$bg_credits.visible = false
	$CreditsHbox.visible = false
	$CreditsHbox/BackButton.visible = false
	$CreditsHbox/BackButtonText.visible = false
	$CreditsText.visible = false
	$transition.play("fade_out")
