extends Node2D

var gridx = 10
var gridy = 15

var win = false


func _ready():
	$dialogue/player.stream_paused = true
	get_tree().get_root().set_disable_input(true)
	$dialogue/textbox.visible = false
	
	$transition.play('fade_out')
	yield($transition, "animation_finished")
	
	$dialogue/player.stream_paused = false
	$dialogue/textbox.visible = true
	get_tree().get_root().set_disable_input(false)


func _process(_delta):
	check_solution()

onready var solution = [ [0, 0, 0, 0, 1, 1, 0, 0, 0, 0], 
						 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
						 [0, 0, 0, 1, 1, 1, 1, 0, 0, 0],
						 [0, 0, 0, 1, 1, 1, 1, 0, 0, 0],
						 [0, 0, 1, 1, 1, 1, 1, 1, 0, 0],
						 [0, 1, 0, 1, 1, 1, 1, 0, 0, 1],
						 [1, 1, 1, 0, 0, 1, 0, 0, 1, 1],
						 [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
						 [0, 1, 1, 1, 1, 1, 1, 1, 1, 0],
						 [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
						 [0, 1, 1, 1, 1, 0, 1, 1, 1, 1],
						 [0, 0, 1, 1, 1, 0, 1, 1, 1, 0],
						 [0, 1, 1, 1, 1, 0, 1, 1, 1, 1],
						 [0, 1, 1, 1, 1, 0, 1, 1, 1, 1],
						 [0, 0, 0, 0, 1, 0, 1, 0, 0, 0]
						]


onready var board = [ [$B1/'00', $B1/'01', $B1/'02', $B1/'03', $B1/'04', $B2/'00', $B2/'01', $B2/'02', $B2/'03', $B2/'04'],
					  [$B1/'10', $B1/'11', $B1/'12', $B1/'13', $B1/'14', $B2/'10', $B2/'11', $B2/'12', $B2/'13', $B2/'14'],
					  [$B1/'20', $B1/'21', $B1/'22', $B1/'23', $B1/'24', $B2/'20', $B2/'21', $B2/'22', $B2/'23', $B2/'24'],
					  [$B1/'30', $B1/'31', $B1/'32', $B1/'33', $B1/'34', $B2/'30', $B2/'31', $B2/'32', $B2/'33', $B2/'34'],
					  [$B1/'40', $B1/'41', $B1/'42', $B1/'43', $B1/'44', $B2/'40', $B2/'41', $B2/'42', $B2/'43', $B2/'44'],
					  [$B3/'00', $B3/'01', $B3/'02', $B3/'03', $B3/'04', $B4/'00', $B4/'01', $B4/'02', $B4/'03', $B4/'04'],
					  [$B3/'10', $B3/'11', $B3/'12', $B3/'13', $B3/'14', $B4/'10', $B4/'11', $B4/'12', $B4/'13', $B4/'14'],
					  [$B3/'20', $B3/'21', $B3/'22', $B3/'23', $B3/'24', $B4/'20', $B4/'21', $B4/'22', $B4/'23', $B4/'24'],
					  [$B3/'30', $B3/'31', $B3/'32', $B3/'33', $B3/'34', $B4/'30', $B4/'31', $B4/'32', $B4/'33', $B4/'34'],
					  [$B3/'40', $B3/'41', $B3/'42', $B3/'43', $B3/'44', $B4/'40', $B4/'41', $B4/'42', $B4/'43', $B4/'44'],
					  [$B5/'00', $B5/'01', $B5/'02', $B5/'03', $B5/'04', $B5/'00', $B6/'01', $B6/'02', $B6/'03', $B6/'04'],
					  [$B5/'10', $B5/'11', $B5/'12', $B5/'13', $B5/'14', $B5/'10', $B6/'11', $B6/'12', $B6/'13', $B6/'14'],
					  [$B5/'20', $B5/'21', $B5/'22', $B5/'23', $B5/'24', $B5/'20', $B6/'21', $B6/'22', $B6/'23', $B6/'24'],
					  [$B5/'30', $B5/'31', $B5/'32', $B5/'33', $B5/'34', $B5/'30', $B6/'31', $B6/'32', $B6/'33', $B6/'34'],
					  [$B5/'40', $B5/'41', $B5/'42', $B5/'43', $B5/'44', $B5/'40', $B6/'41', $B6/'42', $B6/'43', $B6/'44'],
					]


func check_solution():
	if win == false:
		var new_board = []
		
		for y in range(gridy):
			var new_row = []
			
			for x in range(gridx):
				new_row.append(board[y][x].filled)
			new_board.append(new_row)


		if new_board == solution:
			win = true
			show_item()


func show_item():
	$solved.play()
	$level_finish.set_wait_time(1.5)
	$level_finish.start()
	
	$GoodWork.visible = true


func level_finish():
	$GjAngel.visible = true
	$Panel.visible = false
	$B1.visible = false
	$B2.visible = false
	$B3.visible = false
	$B4.visible = false
	$B5.visible = false
	$B6.visible = false
	$appear.play("appear")
	yield($appear, "animation_finished")
	$continue.visible = true


func _on_button_pressed():
	$next_level.play()
	$bgm_fade.play("fade_out")
	
	$transition.play("next_scene")
	yield($transition, "animation_finished")
	get_tree().change_scene("res://cutscenes/Ending_Scene/Ending_Scene.tscn")


func _on_ResetButton_pressed():
	for row in board:
		for box in row:
			box._reset()
