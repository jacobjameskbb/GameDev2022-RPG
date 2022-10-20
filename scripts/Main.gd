extends Node

#onready var save_file = save_file.gamedata
### Main Node ###

# This node's code should be used to coordinate the world and menu manager
# Things such as pausing, starting the game, and ending the game

var in_combat = false

 #func _ready():
	#save_file.score += 1
	#savefile.save_data() 

func _process(_delta):
	
	# If the game is in combat, the camera follows the combat player
	if in_combat:
		$MainCamera.position = $"Combat Manager".current_level.get_node("combat player").position
	# Otherwise, the camera follows the world player
	else:
		$MainCamera.position = $"World Manager/main player".position
	
	$"Menu Manager".position = $MainCamera.position
	$"Dialogue Manager".rect_position =$MainCamera.position

func pause_world():
	$"World Manager".pause_mode = Node.PAUSE_MODE_STOP
	
func unpause_world():
	$"World Manager".pause_mode = Node.PAUSE_MODE_INHERIT
	
func pause_combat():
	$"Combat Manager".pause_mode = Node.PAUSE_MODE_STOP

func unpause_combat():
	$"Combat Manager".pause_mode = Node.PAUSE_MODE_INHERIT

func _on_World_Manager_start_combat(combat_number):
	$"Combat Manager".load_combat(combat_number)
	pause_world()
	$"World Manager".visible = false
	unpause_combat()
	$"Combat Manager".visible = true
	in_combat = true
