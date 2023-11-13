extends Node

var music = load("res://Sounds/music.mp3")

func play_music():
	$BackgroundMusic.stream = music
	$BackgroundMusic.play()
