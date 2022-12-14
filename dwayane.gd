extends RigidBody2D


func _on_player_detect_area_entered(area: Area2D) -> void:
	$slab.visible = false 
