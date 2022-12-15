extends Node


var songs = {
	'overworld': "res://assets/Sound/jon.mp3",
	'1':'res://assets/Sound/mysong.mp3',
	'2':'res://assets/Sound/lvl 2 song.mp3',
	'3':'res://assets/Sound/level3.mp3',
	'4':'res://assets/Sound/level4.mp3',
	'5':'res://assets/Sound/level5.mp3',
}

func _ready():
	play_song('overworld')

func play_song(song_title):
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream= load(songs[song_title])
	$AudioStreamPlayer.play()
	
