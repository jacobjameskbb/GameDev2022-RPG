extends StaticBody2D

var enemy_health = 100

func _process(_delta):
	check_death()

func _on_hurt_box_area_exited(area: Area2D) -> void:
	enemy_health -= 20 
	$health_bar.value -= 20
	print("enemy health",enemy_health)

func check_death():
	if enemy_health <= 0:
		self.queue_free()



