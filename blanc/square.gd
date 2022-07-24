extends Area2D

# Checks if the square is filled or not
var filled = 0
var square = 'blank'

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

	elif event is InputEventMouseButton \
	and event.button_index == BUTTON_RIGHT \
	and event.is_pressed():
		self.on_rightclick()


# Fills in the square when left clicked.
func on_click():
	if $square.animation == 'blank':
		$square.animation = 'filled'
		filled = 1
		
	else:
		$square.animation = 'blank'
		filled = 0
	$left_click.play()


# Marks the square when right clicked (if you know the square can't be filled).
func on_rightclick():
	if $square.animation == 'blank':
		$square.animation = 'marked'
		
	else:
		$square.animation = 'blank'
	filled = 0
	$right_click.play()


# Highlights the square when hovered over with the mouse.
func _on_Box_mouse_entered():
	$hover.animation = 'hover'
	pass


# Unhighlights the square when mouse is off the square.
func _on_Box_mouse_exited():
	$hover.animation = 'none'
	pass

# Reset the square.
func _reset():
	filled = 0
	$square.animation = 'blank'
