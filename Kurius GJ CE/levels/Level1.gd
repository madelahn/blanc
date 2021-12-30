extends Node2D

var gridx = 5
var gridy = 5

var win = false


func _process(_delta):
	check_solution()
	if $dialogue/textbox.visible == true:
		$B1.set_process_input(false)

onready var solution = [ [0, 1, 1, 1, 0],
						 [1, 1, 1, 0, 1],
						 [1, 1, 1, 1, 1],
						 [1, 1, 1, 1, 1],
						 [0, 1, 1, 1, 0],
						]
						
onready var board = [ [$B1/'00', $B1/'01', $B1/'02', $B1/'03', $B1/'04'],
					  [$B1/'10', $B1/'11', $B1/'12', $B1/'13', $B1/'14'],
					  [$B1/'20', $B1/'21', $B1/'22', $B1/'23', $B1/'24'],
					  [$B1/'30', $B1/'31', $B1/'32', $B1/'33', $B1/'34'],
					  [$B1/'40', $B1/'41', $B1/'42', $B1/'43', $B1/'44'],
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
			print("You win!")
			win = true
