extends Button

@export var title = "Under Construction"
@export var price = 0

func _process(delta):
	text = title + "\n" + "$" + str(price)
