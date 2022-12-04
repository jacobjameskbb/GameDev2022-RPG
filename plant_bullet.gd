extends RigidBody2D

var bullet_speed = 2000
var direction = Vector2.ZERO

func _process(delta: float) -> void:
	self.position += bullet_speed * direction
