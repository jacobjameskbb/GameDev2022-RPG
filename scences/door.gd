extends Area2D

export(PackedScene) var target_scene

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_overlapping_bodies().size() > 0:
			return
		
			
func next_level():
	var ERR = get_tree().change_scene_to(target_scene)

