extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal level_finished
export var level_number = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_gem_gem_acquired():
	$"level finish timer".start()


func _on_level_finish_timer_timeout():
	emit_signal("level_finished")
