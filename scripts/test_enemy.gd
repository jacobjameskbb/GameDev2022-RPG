extends KinematicBody2D


var motion = Vector2()

func _physics_process(delta):
	var Player = get_parent().get_node("player")

	position += (Player.position - position)/50 
	get(Player.postion)

	move_and_collide(motion)

