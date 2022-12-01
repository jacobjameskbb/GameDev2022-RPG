extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal level_finished
signal player_died
export var level_number = 0

var gem_colors = {
	1:'green',
	2:'red',
	3:'blue',
	4:'purple',
	5:'yellow'
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$gem/AnimatedSprite.animation = gem_colors[level_number]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_gem_gem_acquired():
	$"level finish timer".start()


func _on_level_finish_timer_timeout():
	emit_signal("level_finished")


func _on_combat_player_player_died():
	emit_signal("player_died")
