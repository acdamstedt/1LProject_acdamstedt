# Algebra1

extends Node

# Camera Variables
var pageSize = 10
var numPages = 3
var pageNum = 1
var correctAnswer

var questionFile
var answerFile


func _ready():
	# Set up titles
	$Clicker1/ClickerTitle.text = "Vaporous Potion of Variables"
	
	# Set up money
	$Clicker1.moneyScale = 1.1
	$Clicker1.startMoney = 1
	$Clicker1.baseUpgradePrice = 10
	$Clicker1.upgradePriceScale = 1.1
	
	# Set up timers

func _process(delta): # While the scene (Algebra 1) is running
	if Input.is_action_pressed("up"): # "page_left" specified in Project Settings -> Input Map
		$Camera2D.position.y -= pageSize
		await get_tree().create_timer(0.5).timeout
	if Input.is_action_pressed("down"):
		$Camera2D.position.y += pageSize
		await get_tree().create_timer(0.5).timeout
	
	$Camera2D.position.y = clamp($Camera2D.position.y, 0, 1980)

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
	$Icon.hide()
	$Answer.text = ""

func _on_answer_text_submitted(new_text):
	if new_text == correctAnswer:
		if ($HUD.totalMoney - $Clicker1.upgradePrice) >= 0:
			$Clicker1.numUpgrades += 1
			$HUD.totalMoney -= $Clicker1.upgradePrice
			$Icon.show()

# Clicker 1
func _on_clicker_1_on_upgrade_pressed():
	_upgradeQuestion("Clicker1Questions", "Clicker1Answers")

func _on_clicker_1_pressed():
	if $Clicker1/ClickerTimer.is_stopped():
		$HUD.totalMoney += $Clicker1.moneyPerClick
		$Clicker1/ClickerTimer.start()

# Clicker 2
func _on_new_clicker_2_pressed(): # Switches NewClicker for Clicker
	$NewClicker2.hide()
	$Clicker2.show()
	
func _on_clicker_2_on_upgrade_pressed():
	$Clicker2.numUpgrades += 1

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

