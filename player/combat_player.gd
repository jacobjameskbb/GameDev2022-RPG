extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var _animated_sprite = $AnimatedSprite

const GRAVITY = 9.8
var velocity = Vector2(0,0)
var player_walk_speed = 500
var player_jump_speed = 1000
var player_is_moving = false
var player_is_jumping = false
var player_is_crouching = false
var player_is_falling = false
var player_is_attacking = false
var max_jump_height = 256 # Player max jump height; each 64 = 1 block. i.e 256 means player can jump four blocks
var jump_height = 0
export var player_number = 1
var player_health = 100

signal player_died

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Sword_position():
	$Sword.scale.x = -1 
	$Sword.scale.position = -$Sword.position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if velocity.x == 0 and player_is_falling == false and player_is_attacking == false:
		$AnimatedSprite.playing = false
	else:
		$AnimatedSprite.playing = true
	
# warning-ignore:unused_argument
func _physics_process(delta):
	
	if player_health <= 0:
			# Player Dies
			emit_signal("player_died")
	
	if player_number == 1:
		
		player_is_moving = false
		
		if Input.is_action_just_pressed("crouch"):
			get_node("CollisionShape2D").disabled = true
			get_node("crouchingshape").disabled = false
			
			# Make player slower, squatter, and lower
			_animated_sprite.scale.y = 0.5
			_animated_sprite.position.y += 16
			player_walk_speed *= 0.5
			
		if Input.is_action_just_released("crouch"):
			get_node("crouchingshape").disabled = true
			get_node("CollisionShape2D").disabled = false
			
			# Reverse crouch changes
			_animated_sprite.scale.y = 1
			_animated_sprite.position.y -= 16
			player_walk_speed *= 2
		
		if Input.is_action_just_pressed("lmb"):
			player_is_attacking = true
			get_node("sword/swordbox").disabled = false
		
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
			_animated_sprite.frame = 0
			
		if Input.is_action_just_released("right"):
			velocity.x = 0
			_animated_sprite.frame = 0
			
		if Input.is_action_just_pressed("jump"):
			if player_is_falling == false:
				player_is_jumping = true
				player_is_falling = true
				velocity.y = -player_jump_speed
				jump_height = position.y - max_jump_height
				
		if Input.is_action_just_released("jump"):
			if player_is_jumping == true:
				if velocity.y <= 0:
					velocity.y = 0
				player_is_jumping = false
			
		# If player has passed the jump height, make them fall/stop jumping
		if position.y <= jump_height:
			if player_is_jumping == true:
				if velocity.y <= 0:
					velocity.y = 0
				player_is_jumping = false
			
		# If player is moving and not attacking, use walking animation
		if player_is_moving and !player_is_attacking:
			_animated_sprite.animation = "walking"
		# If player is attacking, play attack animation
		elif player_is_attacking:
			_animated_sprite.animation = "attack"
		# Otherwise, use default walking animation
		else:
			_animated_sprite.animation = "walking"
			
	# Apply Gravity
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

func _on_AnimatedSprite_animation_finished():
	if player_is_attacking:
		player_is_attacking = false



	


func _on_hurt_box_area_entered(area: Area2D) -> void:
	player_health -= 20 
	print("hello world",player_health)
