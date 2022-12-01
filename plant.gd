extends RigidBody2D

var bullet_speed = 2000
var bullet = preload("res://plant_bullet.tscn")


func fire():
	var bullet_instance = bullet.instance()
	#bullent_instance.position = 
	#bullent_instance.rotation_degrees = rotation_degrees
	#bullent_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	#get_tree().get_root().call_deferred("add_child",bullent_instance)
