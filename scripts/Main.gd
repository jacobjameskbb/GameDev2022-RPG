extends Node

#onready var save_file = save_file.gamedata
### Main Node ###

# This node's code should be used to coordinate the world and menu manager
# Things such as pausing, starting the game, and ending the game

var in_combat = false

func _process(_delta):
	# If the game is in combat, the camera follows the combat player
	if in_combat:
		$MainCamera.position = $"Combat Manager".current_level.get_node("combat player").position
	# Otherwise, the camera follows the world player
	else:
		$MainCamera.position = $"World Manager/main player".position
	
	$"Menu Manager".position = $MainCamera.position
	$"Dialogue Manager".rect_position = $MainCamera.position

func _on_World_Manager_start_combat(combat_number):
	$"Combat Manager".load_combat(combat_number)
	var _world_save = $"World Manager"
	call_deferred('remove_child',$"World Manager")
	$"Combat Manager".visible = true
	in_combat = true
