extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal combat_start

func _ready():
	# This connects all the doors in the world to the area entered function. This way, we don't have to 
	# enter the signals manually
	for child in self.get_children():
		if child.is_in_group('door'):
			child.connect("player_entered",self,"_on_door_entered")

# If a door has been entered by the player, start combat. Comabat is a variable that can be changed from door to door
func _on_door_entered(combat):
	emit_signal("combat_start",combat)
		
