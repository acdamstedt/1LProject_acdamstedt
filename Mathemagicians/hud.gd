# HUD

extends CanvasLayer

# Avatar Button Functionality
func _on_avatar_button_pressed():
	$Background.show() # Probably a way to condense this code using groups, don't know how
	$AvatarImage.show()
	$ExitButton.show()
	$AvatarSelect1.show()
	$AvatarSelect2.show()
	$AvatarSelect3.show()
	$AvatarSelect4.show()

func _on_exit_button_pressed():
	$Background.hide()
	$AvatarImage.hide()
	$ExitButton.hide()
	$AvatarSelect1.hide()
	$AvatarSelect2.hide()
	$AvatarSelect3.hide()
	$AvatarSelect4.hide()
	
