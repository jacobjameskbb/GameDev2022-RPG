extends KinematicBody2D

var is_moving_left = true
var gravity =  10 
var velocity = Vector2(0, 0)
var enemy_health = 100
var speed = 32 # pixels per second
var motion = Vector2.ZERO
var direction = position
var player_position = position 

func _process(_delta):
	move_character()
	detect_turn_around()
	check_death()
func move_character():
	velocity.x = -speed if is_moving_left else speed
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)

func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x # makes body flip

func hit():
	$AttackDetector.monitoring = true

func end_of_hit():
	$AttackDetector.monitoring = false
	
# warning-ignore:unused_argument
func _on_AttackDetector_body_entered(body):
# warning-ignore:return_value_discarded
	pass

func _on_hurt_box_area_entered(area: Area2D) -> void:
	enemy_health -= 20 
	$Bob_health.value -= 20
	print("enemy health",enemy_health)

func check_death():
	if enemy_health <= 0:
		self.queue_free()


func _on_detect_player_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		print("bob")
		var player_position = body.position
		
func _processes(delta: float):
	direction = (player_position - position).normalized()
	move_and_slide(direction*speed)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

