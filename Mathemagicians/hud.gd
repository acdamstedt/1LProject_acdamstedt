# HUD

extends CanvasLayer

@export var totalMoney = 0
var avatar2unlocked = false
var avatar3unlocked = false
var avatar4unlocked = false

signal specialClickerPressed()

func _process(delta):
	$TotalMoney.text = "$" + str(snapped(totalMoney, 0.01))

# Avatar Button Functionality
func _on_avatar_button_pressed():
	$Background.show() # Probably a way to condense this code using groups, don't know how
	$AvatarImage.show()
	$ExitButton.show()
	$AvatarSelect1.show()
	$AvatarSelect2.show()
	$AvatarSelect3.show()
	$AvatarSelect4.show()
	if !avatar2unlocked:
		$Cost.show()
	if !avatar3unlocked:
		$Cost2.show()
	if !avatar4unlocked:
		$Cost3.show()
	

func _on_exit_button_pressed():
	$Background.hide()
	$AvatarImage.hide()
	$ExitButton.hide()
	$AvatarSelect1.hide()
	$AvatarSelect2.hide()
	$AvatarSelect3.hide()
	$AvatarSelect4.hide()
	$LevelSelect.hide()
	$"Cheat $1000".hide()
	if !avatar2unlocked:
		$Cost.hide()
	if !avatar4unlocked:
		$Cost2.hide()
	if !avatar4unlocked:
		$Cost3.hide()


func _on_avatar_select_1_pressed():
	$AvatarImage.texture = load("res://art/Wizard1.png")
	$AvatarButton.icon = load("res://art/Wizard1.png")


func _on_avatar_select_2_pressed():
	if !avatar2unlocked:
		if totalMoney >= 100:
			totalMoney -= 100
			$Cost.hide()
			avatar2unlocked = true
			$AvatarImage.texture = load("res://art/Wizard2.png")
			$AvatarButton.icon = load("res://art/Wizard2.png")
	else:
		$AvatarImage.texture = load("res://art/Wizard2.png")
		$AvatarButton.icon = load("res://art/Wizard2.png")


func _on_avatar_select_3_pressed():
	if !avatar3unlocked:
		if totalMoney >= 5000:
			totalMoney -= 5000
			$Cost2.hide()
			avatar3unlocked = true
			$AvatarImage.texture = load("res://art/Wizard3.png")
			$AvatarButton.icon = load("res://art/Wizard3.png")
	else:
		$AvatarImage.texture = load("res://art/Wizard3.png")
		$AvatarButton.icon = load("res://art/Wizard3.png")


func _on_avatar_select_4_pressed():
	if !avatar4unlocked:
		if totalMoney >= 1000000:
			totalMoney -= 1000000
			$Cost3.hide()
			avatar4unlocked = true
			$AvatarImage.texture = load("res://art/Wizard4.png")
			$AvatarButton.icon = load("res://art/Wizard4.png")
	else: 
		$AvatarImage.texture = load("res://art/Wizard4.png")
		$AvatarButton.icon = load("res://art/Wizard4.png")


func _on_menu_pressed():
	$Background.show()
	$LevelSelect.show()
	$"Cheat $1000".show()
	$ExitButton.show()


func _on_level_select_pressed():
	get_tree().change_scene_to_file("res://level_select.tscn")

func _on_cheat_1000_pressed():
	totalMoney += 1000

func _on_special_clicker_pressed():
	emit_signal("specialClickerPressed")
