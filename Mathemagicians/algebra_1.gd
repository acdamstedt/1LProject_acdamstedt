# Algebra1

extends Node

# Camera Variables
var pageSize = 10
var numPages = 3
var pageNum = 1
var correctAnswer

var questionFile
var answerFile


var currentClicker = []
var currentTimer = []
var currentIcon = []


func _ready():
	# Set up clickers
	$Clicker1/ClickerTitle.text = "Vaporous Potion of Variables"
	_clicker_setup($Clicker1, 1.4, 1, 10, 1.1, 1)
	$Clicker2/ClickerTitle.text = "Illusionary Elixir of Inequalities"
	_clicker_setup($Clicker2, 1.5, 10, 50, 1.2, 2)
	$Clicker3/ClickerTitle.text = "Unstable Sword of Units"
	_clicker_setup($Clicker3, 1.6, 100, 500, 1.3, 3)
	$Clicker4/ClickerTitle.text = "Ghostly Amulet of Graphs"
	_clicker_setup($Clicker4, 1.7, 1000, 5000, 1.4, 4)
	$Clicker5/ClickerTitle.text = "Lit Bomb of Linear Equations"
	_clicker_setup($Clicker5, 1.8, 10000, 10000, 1.4, 10)
	
	# Set up new clickers
	_newclicker_setup($NewClicker2, "Illusionary Elixir of Inequalities", 100)
	_newclicker_setup($NewClicker3, "Unstable Sword of Units", 1000)
	_newclicker_setup($NewClicker4, "Ghostly Amulet of Graphs", 10000)
	_newclicker_setup($NewClicker5, "Lit Bomb of Linear Equations", 100000)


func _process(delta): # While the scene (Algebra 1) is running
	# Camera functionality
	if Input.is_action_pressed("up"): # "page_left" specified in Project Settings -> Input Map
		$Camera2D.position.y -= pageSize
		await get_tree().create_timer(0.5).timeout
	if Input.is_action_pressed("down"):
		$Camera2D.position.y += pageSize
		await get_tree().create_timer(0.5).timeout
	
	$Camera2D.position.y = clamp($Camera2D.position.y, 0, 1980)
	
	if Input.is_action_pressed("click"):
		$ClickSound.play()
	
	if !currentClicker.is_empty():
		$HUD/SpecialClicker.icon = load(currentIcon.front())

func _upgradeQuestion(clickerQuestions, clickerAnswers):
	if ($HUD.totalMoney - $Clicker1.upgradePrice) >= 0:
		$UpgradeBackground.show()
		$Question.show()
		$Answer.show()
		$ExitButton.show()
		
		questionFile = FileAccess.open("res://QuestionBank/Algebra1/" + clickerQuestions + ".txt", FileAccess.READ)
		answerFile = FileAccess.open("res://QuestionBank/Algebra1/" + clickerAnswers + ".txt", FileAccess.READ)
		
		var questions = []
		var answers = []
	
		while not questionFile.eof_reached():
			questions.append(questionFile.get_line())
		
		while not answerFile.eof_reached():
			answers.append(answerFile.get_line())
		
		questionFile.close()
		answerFile.close()
	
		var index = randi() % (questions.size() - 1)
	
		$Question.text = questions[index]
		correctAnswer = answers[index]
	else:
		$UpgradeBackground.show()
		$ExitButton.show()
		$Question.show()
		
		$Question.text = "Not enough money to buy upgrade"

func _on_exit_button_pressed():
	$UpgradeBackground.hide()
	$Question.hide()
	$Answer.hide()
	$ExitButton.hide()
	$Correct.hide()
	$Answer.text = ""

func _on_answer_text_submitted(new_text):
	if new_text == correctAnswer:
		if ($HUD.totalMoney - $Clicker1.upgradePrice) >= 0:
			$Clicker1.numUpgrades += 1
			$HUD.totalMoney -= $Clicker1.upgradePrice
			$Correct.show()

# Clicker 1
func _on_clicker_1_on_upgrade_pressed():
	_upgradeQuestion("Clicker1Questions", "Clicker1Answers")

func _on_clicker_1_pressed():
	_clicker_function($Clicker1, $Clicker1/ClickerTimer)
	_special_clicker_check($Clicker1, $Clicker1/ClickerTimer, "res://art/VaporVariables.png")

# Clicker 2
func _on_new_clicker_2_pressed(): # Switches NewClicker for Clicker
	_newclicker_function($NewClicker2, $Clicker2)

func _on_clicker_2_on_upgrade_pressed():
	_upgradeQuestion("Clicker2Questions", "Clicker2Answers")

func _on_clicker_2_pressed():
	_clicker_function($Clicker2, $Clicker2/ClickerTimer)
	_special_clicker_check($Clicker2, $Clicker2/ClickerTimer, "res://art/IllusionInequalities.png")

# Clicker 3
func _on_new_clicker_3_pressed():
	_newclicker_function($NewClicker3, $Clicker3)

func _on_clicker_3_on_upgrade_pressed():
	_upgradeQuestion("Clicker3Questions", "Clicker3Answers")

func _on_clicker_3_pressed():
	_clicker_function($Clicker3, $Clicker3/ClickerTimer)
	_special_clicker_check($Clicker3, $Clicker3/ClickerTimer, "res://art/UnstableUnits.png")

# Clicker 4
func _on_new_clicker_4_pressed():
	_newclicker_function($NewClicker4, $Clicker4)

func _on_clicker_4_on_upgrade_pressed():
	_upgradeQuestion("Clicker4Questions", "Clicker4Answers")

func _on_clicker_4_pressed():
	_clicker_function($Clicker4, $Clicker4/ClickerTimer)
	_special_clicker_check($Clicker4, $Clicker4/ClickerTimer, "res://art/GhostlyGraphs.png")

# Clicker 5
func _on_new_clicker_5_pressed():
	_newclicker_function($NewClicker5, $Clicker5)

func _on_clicker_5_on_upgrade_pressed():
	_upgradeQuestion("Clicker5Questions", "Clicker5Answers")

func _on_clicker_5_pressed():
	_clicker_function($Clicker5, $Clicker5/ClickerTimer)
	_special_clicker_check($Clicker5, $Clicker5/ClickerTimer, "res://art/LitLinear.png")

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

func _clicker_setup(clicker, moneyScale, startMoney, baseUpgradePrice, upgradeScale, timePerClick):
	clicker.moneyScale = moneyScale
	clicker.startMoney = startMoney
	clicker.baseUpgradePrice = baseUpgradePrice
	clicker.upgradePriceScale = upgradeScale
	clicker.timePerClick = timePerClick

func _newclicker_setup(clicker, title, price):
	clicker.title = title
	clicker.price = price

func _clicker_function(clicker, ClickerTimer):
	if ClickerTimer.is_stopped():
		$HUD.totalMoney += clicker.moneyPerClick
		ClickerTimer.start()
		clicker.disabled = true

func _newclicker_function(newclicker, clicker):
	if $HUD.totalMoney >= newclicker.price:
		$HUD.totalMoney -= newclicker.price
		newclicker.hide()
		clicker.show()

func _special_clicker_setup(clicker, timer, icon):
	$HUD/SpecialClicker.show()
	currentIcon.push_front(icon)
	currentClicker.push_front(clicker)
	currentTimer.push_front(timer)
	$HUD/SpecialClicker.icon = load(currentIcon.front())

func _on_hud_special_clicker_pressed():
	print(currentClicker.size())
	_clicker_function(currentClicker.front(), currentTimer.front())
	currentClicker.pop_front()
	currentTimer.pop_front()
	currentIcon.pop_front()
	print(currentClicker.size())
	if !currentClicker.is_empty():
		$HUD/SpecialClicker.icon = load(currentIcon.front())
	else:
		$HUD/SpecialClicker.hide()

func _special_clicker_check(clicker, timer, icon):
	if currentClicker.has(clicker):
		currentClicker.erase(clicker)
		currentClicker.erase(timer)
		currentIcon.erase(icon)
		if currentClicker.is_empty():
			$HUD/SpecialClicker.hide()

# Timeouts

func _on_clicker_1_clicker_timer_timout():
	$Clicker1.disabled = false
	_special_clicker_setup($Clicker1, $Clicker1/ClickerTimer, "res://art/VaporVariables.png")

func _on_clicker_2_clicker_timer_timout():
	$Clicker2.disabled = false
	_special_clicker_setup($Clicker2, $Clicker2/ClickerTimer, "res://art/IllusionInequalities.png")

func _on_clicker_3_clicker_timer_timout():
	$Clicker3.disabled = false
	_special_clicker_setup($Clicker3, $Clicker3/ClickerTimer, "res://art/UnstableUnits.png")

func _on_clicker_4_clicker_timer_timout():
	$Clicker4.disabled = false
	_special_clicker_setup($Clicker4, $Clicker4/ClickerTimer, "res://art/GhostlyGraphs.png")

func _on_clicker_5_clicker_timer_timout():
	$Clicker5.disabled = false
	_special_clicker_setup($Clicker5, $Clicker5/ClickerTimer, "res://art/LitLinear.png")
