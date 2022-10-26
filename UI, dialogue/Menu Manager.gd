extends Node2D

### Menu Manager ###

# Menu manager should deal with opening/closing the differrent menus
# - Pause menu, Start Menu, Game over menu, etc.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		if !self.visible:
			self.visible = true
			get_tree().paused = true
		elif self.visible:
			self.visible = false
			get_tree().paused = false



func _on_Menu_play_pressed():
	self.visible = false
	get_tree().paused = false
