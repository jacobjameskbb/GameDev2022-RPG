extends Node2D

### World Manager ###

# World manager should control everything that happens in-game
# World manager should contain things such as the player, the environment, the enemies, etc.

signal start_combat
var current_combat_number = 0

func _ready():
	for child in self.get_children():
		if child.is_in_group("world"):
			child.connect("combat_start",self,"combat_trigger")
	
func combat_trigger(combat_number):
	current_combat_number = combat_number
	get_node("overworld/door" + str(combat_number) + "/CollisionShape2D").set_deferred("disabled", true)
	$area_cooldown.start()
	emit_signal("start_combat",combat_number)
	
	
func spawn_gem(combat_number):
	get_node("overworld/door" + str(combat_number) + "/gem").visible = true



func _on_area_cooldown_timeout():
	get_node("overworld/door" + str(current_combat_number) + "/CollisionShape2D").set_deferred("disabled", false)
