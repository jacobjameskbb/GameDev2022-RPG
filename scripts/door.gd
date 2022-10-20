extends Area2D

# This variable indicates the combat to start
export var combat = 1

# signal to check if the player has entered the door
signal player_entered

func _ready():
	pass





# If the player has entered the door, send a signal with the combat number to the world
func _on_door_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("player_entered", combat)
