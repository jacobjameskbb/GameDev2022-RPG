extends KinematicBody2D

var is_moving_left = true

var gravity =  10 # check https://www.youtube.com/watch?v=jQKxOEbbirA for more detail
var velocity = Vector2(0, 0)

var speed = 32 # pixels per second

func _process(_delta):
	move_character()
	detect_turn_around()
		
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
	#get_tree().reload_current_scene()
	pass

# warning-ignore:unused_argument
func _on_PlayerDetector_body_entered(body: Node) -> void:
	pass 
