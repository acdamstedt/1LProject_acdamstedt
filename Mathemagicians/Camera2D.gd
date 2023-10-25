extends Camera2D

#var pageSize = 1280
#var numPages = 2
#
#func _ready():
#	if Input.is_action_pressed("camera_down"):
#		$Camera2D.position.y += pageSize
#	if Input.is_action_pressed("camera_up"):
#		$Camera2D.position.y -= pageSize
#
#		position.y = clamp(position.y, 0, (numPages - 1) * 1280)
