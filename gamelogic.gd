extends Node2D

var currentMultiplier
var currentStage
var currentCooldown
var currentAmountOfTaps
var whoIsInTurn
var score : int = 0
var actualButtons = []



@onready var scoreNode = $Score
@onready var stageIndicator = $StageIndicator


func _ready():
	setStage(1)
	changeTurns(1)

func _process(delta):
	controlTurns()
	updateScore()

func setStage(stage: int):
	stageIndicator.clear()
	currentStage = stage
	match stage:
		1:
			stageIndicator.add_text("1")
			currentCooldown = 0.5
			currentMultiplier = 1
			currentAmountOfTaps = 3
		2:
			stageIndicator.add_text("2")
			currentCooldown = 0.5
			currentMultiplier = 1.2
			currentAmountOfTaps = 5
		3:
			stageIndicator.add_text("3")
			currentCooldown = 0.5
			currentMultiplier = 1.6
			currentAmountOfTaps = 7
		4:
			stageIndicator.add_text("4")
			currentCooldown = 0.5
			currentMultiplier = 1.8
			currentAmountOfTaps = 8
		5:
			stageIndicator.add_text("5")
			currentCooldown = 0.5
			currentMultiplier = 2
			currentAmountOfTaps = 9
		6:
			stageIndicator.add_text("6")
			currentCooldown = 0.5
			currentMultiplier = 2.5
			currentAmountOfTaps = 10

func controlTurns():
	if $Playerdown.isInTurn && $Playerup.isInTurn == false:
		whoIsInTurn == null
		$Playerdown.deactivate()
		$Playerup.deactivate()
		return null

func updateScore():
	scoreNode.clear()
	scoreNode.add_text("Score: " + str(score))

func giveScore(amount: int):
	score += amount

func checkIfButtonsWereCorrect(tapped, actual) -> bool:
	if tapped == actual:
		return true
	else:
		return false

func setCorrectButtons():
	if whoIsInTurn != null:
		match whoIsInTurn:
			'$Playerup':
				actualButtons = $Playerup.tappedButtons.duplicate()
			'$Playerdown':
				actualButtons = $Playerdown.tappedButtons.duplicate()

func changeTurns(player:int):
	print("changed turns")
	setCorrectButtons()
	match player:
		1:
			whoIsInTurn = '$Playerup'
			$Playerup.isInTurn = true
			$Playerdown.isInTurn = false
			$Playerup.canTap = true
			$Playerdown.canTap = false
			$Playerdown.deactivate()
			$Playerup.activate()
		2:
			whoIsInTurn = '$Playerdown'
			$Playerup.isInTurn = false
			$Playerdown.isInTurn = true
			$Playerup.canTap = false
			$Playerdown.canTap = true
			$Playerdown.activate()
			$Playerup.deactivate()
		3:
			whoIsInTurn == null
	




func _on_playerup_player_done_setting():
	changeTurns(2)


func _on_playerdown_player_done_setting():
	changeTurns(1)
