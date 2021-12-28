extends CanvasLayer

export(String, FILE, "*.json") var dialogue

var dialogues = []
var line = 0

func _ready():
	play()
	print(dialogues)


# Plays the sequence of dialogue.
func play():
	dialogues = load_dialogue()
	
	# Resets the lines after dialogue is done.
	line = -1
	next_line()


# Input to go to the next line.
func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		next_line()


# Goes to the next line of the dialogue.
func next_line():
	line += 1
	
	if line >= len(dialogues):
		$textbox.visible = false
		return 
		
	$textbox/portrait/faces.animation = dialogues[line]['face']
	$textbox/dialogue.text = dialogues[line]['text']


# Reads the json file.
func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue):
		file.open(dialogue, file.READ)
		return parse_json(file.get_as_text())
