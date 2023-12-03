# LevelSelect

extends Node


func _on_algebra_1_pressed():
	get_tree().change_scene_to_file("res://algebra_1.tscn")


func _on_algebra_2_pressed():
	get_tree().change_scene_to_file("res://algebra_2.tscn")


func _on_algebra_3_pressed():
	get_tree().change_scene_to_file("res://algebra_3.tscn")
