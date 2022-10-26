extends Control
	
	
signal play_pressed
		
func _on_Quit_Game_pressed():
	get_tree().quit()

func _on_play_pressed():
	emit_signal("play_pressed")
