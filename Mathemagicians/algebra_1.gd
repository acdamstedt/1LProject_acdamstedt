# Algebra1

extends Node

# Camera Variables
var pageSize = 720
var numPages = 2
var pageNum = 1


func _ready():
	$Clicker1/ClickerTitle.text = "Vaporous Potion of Variables" # No clue why this isn't doing what I want it to

func _process(delta): # While the scene (Algebra 1) is running
	if Input.is_action_pressed("page_left"): # "page_left" specified in Project Settings -> Input Map
		$Camera2D.position.x -= pageSize
	if Input.is_action_pressed("page_right"):
		$Camera2D.position.x += pageSize
	
	$Camera2D.position.x = clamp($Camera2D.position.x, 0, (numPages - 1) * pageSize)
	
	if ($Clicker1/UpgradeButton._on_pressed()): # Not working (also not the ideal way)
		emit_signal("clicker1upgrade")
	

# Clicker 1

func _clicker_1_upgrade(): # Not working
	$Clicker1.numUpgrades += 1

# Clicker 2
func _on_new_clicker_2_pressed(): # Switches NewClicker for Clicker
	$NewClicker2.hide()
	$Clicker2.show()

# Clicker 3
func _on_new_clicker_3_pressed():
	$NewClicker3.hide()
	$Clicker3.show()

# Clicker 4
func _on_new_clicker_4_pressed():
	$NewClicker4.hide()
	$Clicker4.show()

# Clicker 5
func _on_new_clicker_5_pressed():
	$NewClicker5.hide()
	$Clicker5.show()

# Clicker 6

# Clicker 7

# Clicker 8

# Clicker 9

# Clicker 10

# Clicker 11

# Clicker 12

# Clicker 13

# Clicker 14

# Clicker 15

# Clicker 16



func _on_clicker_1_on_upgrade_pressed():
	$Clicker1.numUpgrades += 1
	$Clicker1/NumberOfUpgrades.text = str($Clicker1.numUpgrades)
