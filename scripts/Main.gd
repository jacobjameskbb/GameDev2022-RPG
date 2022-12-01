extends Node

#onready var save_file = save_file.gamedata
### Main Node ###

# This node's code should be used to coordinate the world and menu manager
# Things such as pausing, starting the game, and ending the game

var in_combat = false
var _world_save = NAN

var GEM_NUMBER = 5
var current_gems = 0

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
	if !$"Combat Manager".combat_dictionary[combat_number]["completed"]:
		$"Combat Manager".load_combat(combat_number)
		$"World Manager/main player".position = $"World Manager/overworld/player_start_pos".position
		_world_save = $"World Manager"
		call_deferred('remove_child',$"World Manager")
		$"Combat Manager".visible = true
		in_combat = true
		$"Music Manager".play_song(str(combat_number))


func _on_Combat_Manager_finish_combat():
	add_child(_world_save)
	current_gems += 1
	print(current_gems)
	$"World Manager".spawn_gem($"Combat Manager".current_level.level_number)
	$"Combat Manager".visible = false
	in_combat = false
	
	if current_gems == 5:
		print('Victory!')
		end_game()
	else:
		$"Music Manager".play_song("overworld")


func _on_Combat_Manager_player_died():
	add_child(_world_save)
	$"Combat Manager".visible = false
	in_combat = false
	$"Music Manager".play_song("overworld")

func end_game():
	$"World Manager".visible = false
	$"Combat Manager".visible = false
	$"Dialogue Manager".visible = false
