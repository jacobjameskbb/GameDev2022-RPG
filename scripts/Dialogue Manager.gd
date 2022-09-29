extends Control

### Dialogue Manager ###

# Should display dialogue messages in a textbox as needed

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.

# warning-ignore:unused_argument
#func _process(delta):
	#pass
	
onready var textbox = get_node("DialogueBox/Textbox/Text")
var message_queue = []

func display_message(message): # message is a string
	textbox.text = message
	#textbox.percent_visible = 0
	
