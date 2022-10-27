extends KinematicBody2D

#onready var save_file = save_file.gamedata
var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()
var motionspeed = 500
var bullet_speed = 100

var f = 0

func read_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		direction = Vector2(0, -1)
	if Input.is_action_pressed("down"):
		velocity.y += 1
		direction = Vector2(0, 1)
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
	if Input.is_action_pressed("right"):
		velocity.x += 1
		direction = Vector2 (1, 0)
	
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 1000)
	#look_at(get_global_mouse_position())

#func _on_Spell_body_entered(body):
	#if "Enemy" in body.name:
		#kill()

func _physics_process(_delta):
		read_input()
		#f+=_delta
		#print('ding, player can move',f, ' Pause mode: ',get_tree().paused)

func kill():
	# This is a dangerous function, as it will reset the current scene
	# get_tree().reload_current_scene() 
	pass

