extends Node

#onready var save_file = save_file.gamedata
### Main Node ###

# This node's code should be used to coordinate the world and menu manager
# Things such as pausing, starting the game, and ending the game

 #func _ready():
	#save_file.score += 1
	#savefile.save_data() 

func _process(_delta):
	$"Menu Manager".position =$"World Manager/main player/Camera2D".position
	$"Dialogue Manager".rect_position =$"World Manager/main player/Camera2D".position
