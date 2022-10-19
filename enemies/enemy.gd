extends KinematicBody2D

var is_moving_left = true

var gravity =  10 # check https://www.youtube.com/watch?v=jQKxOEbbirA for more detail
var velocity = Vector2(0, 0)

var speed = 32 # pixels per second
	
		
func move_character():
	velocity.x = -speed if is_moving_left else speed
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_entered(body: ):
	pass # Replace with function body.
