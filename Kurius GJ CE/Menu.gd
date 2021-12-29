extends Control

onready var anim_clouds = $anim_clouds
onready var anim_trees = $anim_trees
onready var anim_mountains = $anim_mountains
onready var anim_snow = $anim_snow
onready var transition = $transition

func _ready():
	anim_clouds.play("Clouds")
	anim_trees.play("Trees 2")
	anim_mountains.play("mountains")
	anim_snow.play("Flakes")


func _on_StartButton_pressed():
	$ButtonClickedSound.play()
	transition.play("fade")
	$fade_bgm.play("fade_out")
	if $ButtonClickedSound.playing:
		yield($ButtonClickedSound, "finished")
	get_tree().change_scene("res://test.tscn")
	
