extends Node


var songs = {
	'overworld': "res://assets/Sound/jon.mp3",
	'level 1':''
}

func play_song(song_title):
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream(song_title)
	$AudioStreamPlayer.play()
	
