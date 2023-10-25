extends Node

signal startGame
#var clicker = preload("res://clicker.tscn")
#var newClicker = preload("res://new_clicker.tscn")

func _on_start_button_pressed():
	$StartButton.hide()
	$Title.hide()
	emit_signal("startGame")
	

func StartGame():
	get_tree().change_scene_to_file("res://save_game.tscn")
	
#	# Camera Functionality
#	var pageSize = 1280
#	if Input.is_action_pressed("camera_down"):
#		$Camera2D.position.y += pageSize
#	if Input.is_action_pressed("camera_up"):
#		$Camera2D.position.y -= pageSize
#
#	$Camera2D.position.y = clamp($Camera2D.position.y, 0, 1280)
	
	# First clicker
#	var clicker1 # try using arrays for this step?
#	initClicker(clicker1, $Spot1)
#
#	var newClicker1
#	initNewClicker(newClicker1, $Spot2)
#
#	var newClicker2
#	initNewClicker(newClicker2, $Spot3)
#
#	var newClicker3
#	initNewClicker(newClicker3, $Spot4)
#
#	var newClicker4
#	initNewClicker(newClicker4, $Spot5)
#
#	var newClicker5
#	initNewClicker(newClicker5, $Spot6)
#
#	var newClicker6
#	initNewClicker(newClicker6, $Spot7)
#
#	var newClicker7
#	initNewClicker(newClicker7, $Spot8)
#
#	var newClicker8
#	initNewClicker(newClicker8, $Spot9)
#
#	var newClicker9
#	initNewClicker(newClicker9, $Spot10)

#func initClicker(inputClicker, spot):
#	inputClicker = clicker.instantiate()
#	add_child(inputClicker)
#	inputClicker.position = spot.position
#	# Initialize clicker specific values here
#
#func initNewClicker(inputNewClicker, spot):
#	inputNewClicker = newClicker.instantiate()
#	add_child(inputNewClicker)
#	inputNewClicker.position = spot.position
#	# Initialize new clicker specific values here
