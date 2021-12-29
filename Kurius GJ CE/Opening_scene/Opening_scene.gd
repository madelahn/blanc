extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




# Called when the node enters the scene tree for the first time.
func _ready():
	$contemplation.play()
	$anim_snow.play("Flakes")
	$bg_pan.play("bg_pan")
	$tim_wind.play("tim_wind_2")
	$transition.play("fade_out")
	print("uhh")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
