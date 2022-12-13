extends RigidBody2D

var bullet_speed = 2
var direction = Vector2.ZERO
var is_moving_left = true

func _process(delta: float) -> void:
	self.position += bullet_speed * direction
	#print(position)
	pass
