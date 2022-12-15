extends RigidBody2D

var is_moving_left = true
var velocity = Vector2(0, 0)
var enemy_health = 100
var speed = 64 # pixels per second

func _process(_delta):
	move_character()
	detect_turn_around()
	check_death()
func move_character():
	velocity.x = -speed if is_moving_left else speed
	velocity.y -= 10
	position += velocity * speed

func detect_turn_around():
	if $RayCast2D.is_colliding():
		is_moving_left = !is_moving_left
		scale.x = -scale.x # makes body flip

func hit():
	$AttackDetector.monitoring = true

func end_of_hit():
	$AttackDetector.monitoring = false
	
func _on_hurt_box_area_exited(area: Area2D) -> void:
	enemy_health -= 20 
	$health_bar.value -= 20
	print("enemy health",enemy_health)

	
func check_death():
	if enemy_health <= 0:
		self.queue_free()



func _on_detect_player_body_entered(body: Node) -> void:
	pass # Replace with function body.
