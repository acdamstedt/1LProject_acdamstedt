extends Node

var clicker = preload("res://clicker.tscn")
var newClicker = preload("res://new_clicker.tscn")

func _ready():
	$TopOfScreen.hide()
	$BottomOfScreen.hide()
	$AvatarButton.hide()
	$TotalMoney.hide()

func StartGame():
	$TopOfScreen.show()
	$BottomOfScreen.show()
	$AvatarButton.show()
	$TotalMoney.show()
	
	# First clicker
	var clicker1 # try using arrays for this step?
	initClicker(clicker1, $Spot1)
	
	var newClicker1
	initNewClicker(newClicker1, $Spot2)
	
	var newClicker2
	initNewClicker(newClicker2, $Spot3)
	
	var newClicker3
	initNewClicker(newClicker3, $Spot4)
	
	var newClicker4
	initNewClicker(newClicker4, $Spot5)
	
	var newClicker5
	initNewClicker(newClicker5, $Spot6)
	
	var newClicker6
	initNewClicker(newClicker6, $Spot7)
	
	var newClicker7
	initNewClicker(newClicker7, $Spot8)
	
	var newClicker8
	initNewClicker(newClicker8, $Spot9)
	
	var newClicker9
	initNewClicker(newClicker9, $Spot10)
	
	var scrollSpeed = 1280
	if Input.is_action_pressed("camera_down"):
		$Camera2D.position.y += scrollSpeed
	if Input.is_action_pressed("camera_up"):
		$Camera2D.position.y -= scrollSpeed
	
	$Camera2D.position.y = clamp($Camera2D.position.y, 0, 1280)
	
#	if Input.is_action_pressed("camera_down"):
#		$Camera2D.position.y += 1
#	if Input.is_action_pressed("camera_up"):
#		$Camera2D.position.y -= 1
#
#	$Camera2D.position.y = clamp($Camera2D.position.y, 0, 1224)
	
	# I can not for the life of me figure out why I can't connect 
	# 	the button's press signal to a func within the code
	
#	$newClicker1.pressed().connect(newClickerPressed())
	
#	var newClicker1
#	initNewClicker(newClicker1, $Spot2)
#	$newClicker1.pressed.connect(newClickerPressed())
	


#func newClickerPressed():
##	newClicker1.hide()
#	var clicker2
#	initClicker(clicker2, $Spot2)

#func _on_new_clicker_pressed(newClicker):
#	newClicker.hide()
#	var clicker2
#	initClicker(clicker2, $Spot2)

func initClicker(inputClicker, spot):
	inputClicker = clicker.instantiate()
	add_child(inputClicker)
	inputClicker.position = spot.position
	# Initialize clicker specific values here

func initNewClicker(inputNewClicker, spot):
	inputNewClicker = newClicker.instantiate()
	add_child(inputNewClicker)
	inputNewClicker.position = spot.position
	# Initialize new clicker specific values here

#func newClickerPressedConnect(inputNewClicker):
#	$inputNewClicker.pressed().connect(newClickerPressed())
