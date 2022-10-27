extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const GRAVITY = 9.8
var velocity = Vector2(0,0)
var player_walk_speed = 500
var player_jump_speed = 1000
var player_is_moving = false
var player_is_jumping = false
var player_is_crouching = false
var player_is_falling = false
var jump_height = 1000
export var player_number = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _init_states():
#	add_state("crouch")
#	add_state("crawl")

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if velocity.x == 0 and player_is_falling == false:
		$AnimatedSprite.playing = false
	else:
		$AnimatedSprite.playing = true
	

# warning-ignore:unused_argument
func _physics_process(delta):
	
	if player_number == 1:
		
		if Input.is_action_just_pressed("crouch"):
			player_is_crouching = true
		
		if Input.is_action_just_released("crouch"):
			player_is_crouching = false
		
		if Input.is_action_pressed("left"):
			velocity.x -= player_walk_speed
			player_is_moving = true
			$AnimatedSprite.scale.x = -1
			
		if Input.is_action_pressed("right"):
			velocity.x += player_walk_speed
			player_is_moving = true
			$AnimatedSprite.scale.x = 1
			
		if Input.is_action_just_released("left"):
			velocity.x = 0
			
		if Input.is_action_just_released("right"):
			velocity.x = 0
			
		if Input.is_action_pressed("jump"):
			if player_is_falling == false:
				player_is_jumping = true
				player_is_falling = true
				velocity.y = -player_jump_speed
				jump_height = position.y - 200
				
		if Input.is_action_just_released("jump"):
			if player_is_jumping == true:
				if velocity.y <= 0:
					velocity.y = 0
				player_is_jumping = false
			
	velocity.y += GRAVITY
	
	# Cap Speed
	if abs(velocity.x) >= player_walk_speed:
		velocity.x = player_walk_speed * (velocity.x / abs(velocity.x))
	
# warning-ignore:return_value_discarded
	move_and_slide(velocity, Vector2(0, -1))

func _on_floor_body_shape_entered(_body_id, _body, _body_shape, _local_shape):
	player_is_jumping = false
	player_is_falling = false

func _on_ceiling_body_shape_entered(_body_id, _body, _body_shape, _local_shape):
	if player_is_jumping == true:
		if velocity.y <= 0:
			velocity.y = 0
		player_is_jumping = false

