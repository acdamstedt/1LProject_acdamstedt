extends Node

var pageSize = 720
var numPages = 2
var pageNum = 1

signal clicker1upgrade

func _process(delta):
	if Input.is_action_pressed("page_left"):
		$Camera2D.position.x -= pageSize
	if Input.is_action_pressed("page_right"):
		$Camera2D.position.x += pageSize
	
	$Camera2D.position.x = clamp($Camera2D.position.x, 0, (numPages - 1) * pageSize)
	
	if ($Clicker1/UpgradeButton._on_pressed()):
		emit_signal("clicker1upgrade")

# Clicker 1
func _clicker_1_upgrade():
	$Clicker1.numUpgrades += 1

# Clicker 2
func _on_new_clicker_2_pressed():
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

