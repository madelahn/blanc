extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$blanc.play()
	$anim_snow.play("Flakes")
	$tim_wind.play("tim_wind2")
	$transition.play("fade_out")
	
# To be played after the end of the dialogue
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				print("stan loona")
				$bg_pan.play("bg_pan")
				
				get_node("bg_pan").queue("anim_blanc")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
