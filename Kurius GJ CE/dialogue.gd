extends CanvasLayer

export(String, FILE, "*.json") var dialogue

var dialogues = []

func _ready():
	play()
	print(dialogues)

func play():
	dialogues = load_dialogue()
	
	$textbox/dialogue.text = dialogues[0]['text']

func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue):
		file.open(dialogue, file.READ)
		return parse_json(file.get_as_text())
