extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Preload all the combat levels
var level_1 = preload("res://scences/level1.tscn")

# Combat Dictionary
# This ties each level to a number

var combat_dictionary = {
	1 : level_1
}

# Current loaded level
var current_level = NAN

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func load_combat(number):
	var combat = combat_dictionary[number].instance()
	add_child(combat)
	current_level = combat
