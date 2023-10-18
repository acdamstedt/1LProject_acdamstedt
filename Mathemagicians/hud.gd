extends CanvasLayer

signal startGame

func _on_start_button_pressed():
	$StartButton.hide()
	$Title.hide()
	emit_signal("startGame")
