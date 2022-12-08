extends KinematicBody2D

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
	
	velocity = move_and_slide(velocity, Vector2.UP)

func detect_turn_around():
	if $RayCast2D.is_colliding():
		is_moving_left = !is_moving_left
		scale.x = -scale.x # makes body flip

func hit():
	$AttackDetector.monitoring = true

func end_of_hit():
	$AttackDetector.monitoring = false
	
# warning-ignore:unused_argument
func _on_AttackDetector_body_entered(body):
# warning-ignore:return_value_discarded
	#get_tree().reload_current_scene()
	pass

func _on_hurt_box_area_entered(area: Area2D) -> void:
	enemy_health -= 20 
	$Bob_health.value -= 20
	print("enemy health",enemy_health)

func check_death():
	if enemy_health <= 0:
		# This will reload either the enemy scene or the level scene.
		#get_tree().reload_current_scene()
		# Instead, we can free the enemy from the scene:
		self.queue_free()
