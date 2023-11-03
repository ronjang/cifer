extends Node2D

var currentMultiplier
var currentStage
var currentCooldown
var currentAmountOfTaps
var whoIsInTurn
var score : int = 0



@onready var scoreNode = $Score
@onready var players = [$Playerup,$Playerdown]
@onready var stageIndicator = $StageIndicator


func _ready():
	setStage(1)


func _process(delta):
	controlTurns()
	updateScore()


func setStage(stage: int):
	stageIndicator.clear()
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
	if $Playerup.isInTurn == true:
		whoIsInTurn == $Playerup
		print("Playerup playing")
	if $Playerdown.isInTurn == true:
		whoIsInTurn == $Playerdown
	if $Playerup.isInTurn && $Playerdown.isInTurn != true:
		whoIsInTurn = null
	if whoIsInTurn != null:
		match whoIsInTurn:
			'$Playerup':
				$Playerup.activate()
			'$Playerdown':
				$Playerdown.activate()

func updateScore():
	scoreNode.clear()
	scoreNode.add_text("Score: " + str(score))

func giveScore(amount: int):
	score += amount
