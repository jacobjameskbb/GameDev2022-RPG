extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const GRAVITY = 9.8
var velocity = Vector2(0,0)
var player_walk_speed = 500
var player_jump_speed = 500
var player_is_moving = false
var player_is_jumping = false
var player_is_falling = false
var jump_height = 10000
export var player_number = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if velocity.x == 0 and player_is_falling == false:
		$AnimatedSprite.playing = false
	else:
		$AnimatedSprite.playing = true
	

func _physics_process(delta):
	
	if player_number == 1:
		if Input.is_action_pressed("player1_left"):
			velocity.x -= player_walk_speed
			player_is_moving = true
			$AnimatedSprite.scale.x = -1
			
		if Input.is_action_pressed("player1_right"):
			velocity.x += player_walk_speed
			player_is_moving = true
			$AnimatedSprite.scale.x = 1
			
		if Input.is_action_just_released("player1_left"):
			velocity.x = 0
			
		if Input.is_action_just_released("player1_right"):
			velocity.x = 0
			
		if Input.is_action_pressed("player1_jump"):
			if player_is_falling == false:
				player_is_jumping = true
				player_is_falling = true
				velocity.y = -player_jump_speed
				jump_height = position.y - 200
				
		if Input.is_action_just_released("player1_jump"):
			if player_is_jumping == true:
				if velocity.y <= 0:
					velocity.y = 0
				player_is_jumping = false

	elif player_number == 2:
		if Input.is_action_pressed("player2_left"):
			velocity.x -= player_walk_speed
			player_is_moving = true
			$AnimatedSprite.scale.x = -1
			
		if Input.is_action_pressed("player2_right"):
			velocity.x += player_walk_speed
			player_is_moving = true
			$AnimatedSprite.scale.x = 1
			
		if Input.is_action_just_released("player2_left"):
			velocity.x = 0
			
		if Input.is_action_just_released("player2_right"):
			velocity.x = 0
			
		if Input.is_action_pressed("player2_jump"):
			if player_is_falling == false:
				player_is_jumping = true
				player_is_falling = true
				velocity.y = -player_jump_speed
				jump_height = position.y - 200
				
		if Input.is_action_just_released("player2_jump"):
			if player_is_jumping == true:
				if velocity.y <= 0:
					velocity.y = 0
				player_is_jumping = false
	
			
	velocity.y += GRAVITY
	
	# Cap Speed
	if abs(velocity.x) >= player_walk_speed:
		velocity.x = player_walk_speed * (velocity.x / abs(velocity.x))
	
	move_and_slide(velocity, Vector2(0, -1))

func _on_floor_body_shape_entered(body_id, body, body_shape, local_shape):
	player_is_jumping = false
	player_is_falling = false

func _on_ceiling_body_shape_entered(body_id, body, body_shape, local_shape):
	if player_is_jumping == true:
		if velocity.y <= 0:
			velocity.y = 0
		player_is_jumping = false
