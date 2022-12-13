extends StaticBody2D


onready var bullet = preload("res://plant_bullet.tscn")
var player_position = Vector2.ZERO
var enemy_health = 100

#func fire():
#	bullet_instance.position = player_position
#	bullet_instance.rotation_degrees = rotation_degrees
#	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
#	get_tree().get_root().call_deferred("add_child",bullet_instance)

func _process(_delta):
	check_death()

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		var player_position = body.position
		$Timer.start()
		print("plant see uuuuuuuuuu")

func _on_Timer_timeout() -> void:
	var current_bullet = bullet.instance()
	#current_bullet.facing = 'left'
	print('plab ',position)
	current_bullet.direction = self.position - player_position
	current_bullet.position = self.position - Vector2(200,0)
	add_child(current_bullet)
	print("muhahahahahaha: ", current_bullet.position)

func _on_hurtbox_area_entered(area: Area2D) -> void:
	enemy_health -= 10
	print("enemy health",enemy_health)
	$health_bar.value -= 10

func check_death():
	if enemy_health <= 0:
		self.queue_free()
