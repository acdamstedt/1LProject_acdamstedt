# Main

extends Node

# Can create custom signals
signal startGame

func _on_start_button_pressed():
	$StartButton.hide()
	$Title.hide()
	emit_signal("startGame")
	

func StartGame():
	get_tree().change_scene_to_file("res://level_select.tscn") # Changes scene
