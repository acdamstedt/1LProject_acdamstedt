# Clicker

extends Button

@onready var number_of_upgrades = $NumberOfUpgrades
signal onUpgradePressed()
# Creating modifiable variables in Inspector (with default values)
@export var numUpgrades = 0
@export var moneyPerClick = 0
@export var timePerClick = 1
@export var upgradePrice = 0;

func _process(delta):
	$ClickerTitle.text = "Default"
	$NumberOfUpgrades.text = str(numUpgrades)
	$MoneyPerClick.text = str(moneyPerClick)
	$ClickerTimer.wait_time = timePerClick
	$UpgradeButton.text = "Buy x1:\n$" + str(upgradePrice)
	# $ClickerTimerDisplay.text = $ClickerTimer.what goes here?



func _on_upgrade_button_pressed():
	emit_signal("onUpgradePressed")
