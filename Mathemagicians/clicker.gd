# Clicker

extends Button

signal onUpgradePressed()

# Creating modifiable variables in Inspector (with default values)
@export var moneyPerClick = 0
@export var startMoney = 0
@export var moneyScale = 0

@export var timePerClick = 1

@export var numUpgrades = 0
@export var upgradePrice = 0
@export var baseUpgradePrice = 0
@export var upgradePriceScale = 0

func _process(delta):
	upgradePrice = snapped(baseUpgradePrice * pow(upgradePriceScale, numUpgrades), 0.01)
	moneyPerClick = snapped(startMoney * pow(moneyScale, numUpgrades), 0.01)
	$NumberOfUpgrades.text = str(numUpgrades)
	$MoneyPerClick.text = "$" + str(moneyPerClick)
	$ClickerTimer.wait_time = timePerClick
	$UpgradeButton.text = "Buy x1:\n$" + str(upgradePrice)
	$ClickerTimerDisplay.text = str(snapped($ClickerTimer.time_left, 0.1)) + "s"



func _on_upgrade_button_pressed():
	emit_signal("onUpgradePressed")
