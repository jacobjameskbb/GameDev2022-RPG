extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite

func _process(_delta):
	if Input.is_action_pressed("lmb"):
		_animated_sprite.play("sword")
	else:
		_animated_sprite.stop()
		
	if Input.is_action_just_released("lmb"):
		_animated_sprite.frame = 0

