extends RayCast2D

var target = Area2D

func _physics_process(delta: float) -> void:
	if is_colliding():
		target = get_collider()
