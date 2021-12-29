extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var animation = $AnimationPlayer
onready var animation2 = $AnimationPlayer2
onready var animation3 = $AnimationPlayer3
onready var animation4 = $AnimationPlayer4
onready var animation5 = $AnimationPlayer5

onready var current_level = $menu


# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Clouds")
	animation2.play("Trees 2")
	animation3.play("mountains")
	animation4.play("Flakes")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	$ButtonClickedSound.play()
	animation5.play("fade")
	if $ButtonClickedSound.playing:
		yield($ButtonClickedSound, "finished")
		print("stan looona")
	get_tree().change_scene("res://test.tscn")
	
