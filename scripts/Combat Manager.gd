extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Preload all the combat levels
var level_1 = preload("res://scences/level1.tscn")
var level_2 = preload("res://scences/level2.tscn")
var level_3 = preload("res://scences/level3.tscn")
var level_4 = preload("res://scences/level4.tscn")
var level_5 = preload("res://scences/level5.tscn")

# Combat Dictionary
# This ties each level to a number

var combat_dictionary = {
	1 : {"level":level_1,"completed":false},
	2 : {"level":level_2,"completed":false},
	3 : {"level":level_3,"completed":false},
	4 : {"level":level_4,"completed":false},
	5 : {"level":level_5,"completed":false},
}

# Current loaded level
var current_level = NAN

signal finish_combat
signal player_died

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_combat(number):
	var combat = combat_dictionary[number]["level"].instance()
	call_deferred('add_child',combat)
	current_level = combat
	current_level.connect("level_finished",self,"end_level")
	current_level.connect("player_died",self,"player_died")

func player_died():
	call_deferred("remove_child",current_level)
	current_level.queue_free()
	emit_signal("player_died")
	
func end_level():
	combat_dictionary[current_level.level_number]["completed"] = true
	call_deferred("remove_child",current_level)
	current_level.queue_free()
	emit_signal("finish_combat")
	
