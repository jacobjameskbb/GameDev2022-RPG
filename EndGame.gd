extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var time = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_viewport_rect().size / 2
	
	if $TileMap.position.x <= -520:
		$TileMap.position.x = 0
	
	$TileMap.position.x -= delta * 100
	
	$player.rotation += delta
	time += delta

	$gem1.position = Vector2(200 * cos(2*PI/5 + time + PI/2), -200 * sin(2*PI/5 + time + PI/2))
	$gem2.position = Vector2(200 * cos(4*PI/5 + time + PI/2), -200 * sin(4*PI/5 + time + PI/2))
	$gem3.position = Vector2(200 * cos(6*PI/5 + time + PI/2), -200 * sin(6*PI/5 + time + PI/2))
	$gem4.position = Vector2(200 * cos(8*PI/5 + time + PI/2), -200 * sin(8*PI/5 + time + PI/2))
	$gem5.position = Vector2(200 * cos(0 + time + PI/2), - 200 * sin(0 + time + PI/2))


func _on_Button_pressed():
	get_tree().quit()
