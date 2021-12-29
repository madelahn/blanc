extends Control

onready var animation = $AnimationPlayer

func _ready():
	animation.play("fade_out")
	print("stan loonar")
