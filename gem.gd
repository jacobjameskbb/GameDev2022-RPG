extends Area2D

var float_number = 0
export(String, "green", "red", "blue", "purple", "yellow") var gem_color

signal gem_acquired 

export var sprite_only = false

func _ready():
	if sprite_only:
		$CollisionShape2D.disabled = true
		
	#print('ding',gem_color)
	#$AnimatedSprite.animation = gem_color

func _process(delta):
	
	# Made a manual hovering animation for the gem
	float_number += delta * 5
	if float_number >= 360:
		float_number = 0
	$AnimatedSprite.position.y += sin(float_number)*0.3
	
	# Label will go up if it is revealed
	if $Label.visible:
		if $Label.rect_position.y >= -40:
			$Label.rect_position.y -= 20*delta
		else:
			$Label.visible = false
			emit_signal("gem_acquired")
			# When this Label turns invisible, it will be time to quit level 1.
			# We want this node to send a signal to level1 to send a signal to WorldManager.
			# This can start the transition back to the world map so the user can select another level.
			
func _on_Area2D_body_entered(_body):
	# Let's not destroy the gem, maybe instead transform it into the label?
	#queue_free()
	$AnimatedSprite.visible = false
	$Label.visible = true	
