extends Control

func _on_Quit_Game_pressed():
	get_tree().quit()
	


func _on_play_pressed():
	get_tree().change_scene("res://scenes/main.tscn")
	#get_tree().change_scene("res://levels/level"+str(int(get_tree().current_scene.filename[-6])+1)+".tscn")
