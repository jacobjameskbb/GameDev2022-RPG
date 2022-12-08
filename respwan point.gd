extends Area2D

var player_position = 98 

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		#player_position.x = 5465
		#player_position.y = -235
		global_position = Vector2(5465,-235)
