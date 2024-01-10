extends Node2D

var currentMultiplier
var currentStage
var currentCooldown
var currentAmountOfTaps
var whoIsInTurn
var whoIsTapping
var gameState
var score : int = 0
var baseScore : float = 100
var turnsTaken : int = 0
var actualButtons = []
var tappedButtons = []



@onready var scoreNode = $Score
@onready var stageIndicator = $StageIndicator


func _ready():
	setStage(1)
	controlTurns()
	changeTurns(1)
	stageIndicator.clear()
	stageIndicator.add_text("1")
	currentStage = 1
	score = 0
	turnsTaken = 0

func _process(delta):
	updateScore()

func setStage(stage: int):
	stageIndicator.clear()
	currentStage = stage
	match stage:
		1:
			stageIndicator.add_text("1")
			currentStage = 1
			currentCooldown = 0.5
			currentMultiplier = 1
			currentAmountOfTaps = 3
		2:
			stageIndicator.add_text("2")
			currentStage = 2
			currentCooldown = 0.5
			currentMultiplier = 1.2
			currentAmountOfTaps = 5
		3:
			stageIndicator.add_text("3")
			currentStage = 3
			currentCooldown = 0.5
			currentMultiplier = 1.6
			currentAmountOfTaps = 7
		4:
			stageIndicator.add_text("4")
			currentStage = 4
			currentCooldown = 0.5
			currentMultiplier = 1.8
			currentAmountOfTaps = 8
		5:
			stageIndicator.add_text("5")
			currentStage = 5
			currentCooldown = 0.5
			currentMultiplier = 2
			currentAmountOfTaps = 9
		6:
			stageIndicator.add_text("6")
			currentStage = 6
			currentCooldown = 0.5
			currentMultiplier = 2.5
			currentAmountOfTaps = 10




func updateScore():
	scoreNode.clear()
	scoreNode.add_text("Score: " + str(score))

func giveScore(amount: int):
	score += amount

func checkIfButtonsWereCorrect(tapped, actual) -> bool:
	if tapped == actual:
		print("correct Answer!")
		giveScore(baseScore * currentMultiplier)
		return true
	else:
		return false


func controlTurns():
	match whoIsInTurn:
		'$Playerup':
			tappedButtons = $Playerup.tappedButtons.duplicate()
		'$Playerdown':
			tappedButtons = $Playerdown.tappedButtons.duplicate()
	if turnsTaken % 2 == 0:
		if $Playerup.isInTurn:
			$Playerup.isInTurn = false
			$Playerdown.isInTurn = true
		else:
			if $Playerdown.isInTurn:
				$Playerup.isInTurn = true
				$Playerdown.isInTurn = false
		currentStage += 1
		setStage(currentStage)
		setCorrectButtons()
		print("tappedButtons ", tappedButtons)
		print("actualButtons ", actualButtons)
		checkIfButtonsWereCorrect(tappedButtons, actualButtons)
		turnsTaken += 1
		print("changed turns")




func setCorrectButtons():
	if whoIsTapping != null:
		match whoIsTapping:
			'$Playerup':
				actualButtons = $Playerup.tappedButtons.duplicate()
			'$Playerdown':
				actualButtons = $Playerdown.tappedButtons.duplicate()


func changeTurns(player:int):
	controlTurns()
	match player:
		1:
			whoIsTapping = '$Playerup'
			$Playerup.amountOfTaps = currentAmountOfTaps
			$Playerup.canTap = true
			$Playerdown.canTap = false
			$Playerdown.deactivate()
			$Playerup.activate()
		2:
			whoIsTapping = '$Playerdown'
			$Playerdown.amountOfTaps = currentAmountOfTaps
			$Playerup.canTap = false
			$Playerdown.canTap = true
			$Playerup.deactivate()
			$Playerdown.activate()
		3:
			whoIsTapping == null
			$Playerup.canTap = false
			$Playerup.isInTurn = false
			$Playerdown.canTap = false
			$Playerdown.isInTurn = false
			$Playerdown.deactivate()
			$Playerup.deactivate()



func _on_playerup_player_done_setting():
	changeTurns(2)


func _on_playerdown_player_done_setting():
	changeTurns(1)
