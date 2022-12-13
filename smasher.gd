extends KinematicBody2D

var is_moving_down = true
var velocity = Vector2(0, 0)
var speed = 64 # pixels per second

func _process(_delta):
	detect_turn_around()

func move_character():
	velocity.x = -speed if is_moving_down else speed
	
	velocity = move_and_slide(velocity, Vector2.UP)

func detect_turn_around():
	if $RayCast2D.is_colliding():
		is_moving_down = !is_moving_down
		scale.x = -scale.x # makes body flip

