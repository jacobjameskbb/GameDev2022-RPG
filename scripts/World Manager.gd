extends Node2D

### World Manager ###

# World manager should control everything that happens in-game
# World manager should contain things such as the player, the environment, the enemies, etc.

signal start_combat

func _ready():
	for child in self.get_children():
		if child.is_in_group("world"):
			child.connect("combat_start",self,"combat_trigger")
	
func combat_trigger(combat_number):
	emit_signal("start_combat",combat_number)
	
	
