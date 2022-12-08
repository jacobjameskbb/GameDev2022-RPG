extends StaticBody2D


onready var bullet = preload("res://plant_bullet.tscn")
var player_position = Vector2.ZERO
var enemy_health = 100
#func fire():
	#bullet_instance.position = player_position
	#bullet_instance.rotation_degrees = rotation_degrees
	#bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	#get_tree().get_root().call_deferred("add_child",bullet_instance)


func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		var player_position = body.position
		$Timer.start()
		print("plant see uuuuuuuuuu")

func _on_Timer_timeout() -> void:
	var current_bullet = bullet.instance()
	#current_bullet.facing = 'left'
	current_bullet.direction = self.position - player_position
	add_child(current_bullet)
	print("muhahahahahaha")

func _on_hurtbox_area_entered(area: Area2D) -> void:
	enemy_health -= 10
	print("enemy health",enemy_health)
