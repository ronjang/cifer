extends Control

var currentMultiplier
var currentStage
var maxStage
var currentCooldown
var currentAmountOfTaps
var whoIsInTurn
var gameState

var scoreUp : int = 0
var scoreDown : int = 0
var baseScore : float = 100
var turnsTaken : int = 0
var correctButtons = []
var tappedButtons = []

onready var scoreUpNode = get_node("Background/ScoreUp/Score")
onready var scoreDownNode = get_node("Background/ScoreDown/Score")
onready var stageIndicator = get_node("Background/Stage/StageIndicator")
onready var animationPlayer = get_node("Background/AnimationPlayer")


func _ready():
	BackgroundMusic.volume_db = -999
	setStage(1)
	changeTurns(1)
	$Playerup.isGuessing = false
	$Playerup.isTyping = true
	stageIndicator.clear()
	stageIndicator.add_text("I")
	currentStage = 1
	turnsTaken = 0
	scoreUp = 0
	scoreDown = 0
	correctButtons.clear()
	tappedButtons.clear()

func _process(delta):
	updateScore()

func setStage(stage: int):
	stageIndicator.clear()
	currentStage = stage
	maxStage = 6
	match stage:
		1:
			stageIndicator.add_text("I")
			currentStage = 1
			currentCooldown = 0.5
			currentMultiplier = 1
			currentAmountOfTaps = 3
		2:
			stageIndicator.add_text("II")
			currentStage = 2
			currentCooldown = 0.5
			currentMultiplier = 1.2
			currentAmountOfTaps = 5
		3:
			stageIndicator.add_text("III")
			currentStage = 3
			currentCooldown = 0.5
			currentMultiplier = 1.6
			currentAmountOfTaps = 7
		4:
			stageIndicator.add_text("IV")
			currentStage = 4
			currentCooldown = 0.5
			currentMultiplier = 1.8
			currentAmountOfTaps = 8
		5:
			stageIndicator.add_text("V")
			currentStage = 5
			currentCooldown = 0.5
			currentMultiplier = 2
			currentAmountOfTaps = 9
		6:
			stageIndicator.add_text("VI")
			currentStage = 6
			currentCooldown = 0.5
			currentMultiplier = 2.5
			currentAmountOfTaps = 10

func updateScore():
	scoreUpNode.clear()
	scoreUpNode.add_text(str(scoreUp))
	scoreDownNode.clear()
	scoreDownNode.add_text(str(scoreDown))

func updateStage():
	if currentStage == maxStage:
		endGame()
	if turnsTaken > 0 and turnsTaken % 2 == 0:
		setStage(currentStage+1)
	$Playerdown.amountOfTaps = currentAmountOfTaps
	$Playerup.amountOfTaps = currentAmountOfTaps

func giveScore(amount: int):
	match whoIsInTurn:
		'$Playerup':
			scoreUp += amount
		'$Playerdown':
			scoreDown += amount

func checkIfButtonsWereCorrect(tapped, actual) -> bool:
	if tapped == actual:
		giveScore(baseScore * currentMultiplier)
		if whoIsInTurn != null:
			match whoIsInTurn:
				'$Playerup':
					animationPlayer.play("correctUp")
				'$Playerdown':
					animationPlayer.play("correctDown")
		return true
	else:
		if whoIsInTurn != null:
			match whoIsInTurn:
				'$Playerup':
					animationPlayer.play("wrongUp")
				'$Playerdown':
					animationPlayer.play("wrongDown")
		return false

func handlePlayer():
	match whoIsInTurn:
		'$Playerup':
			if $Playerup.isGuessing == true:
				checkIfButtonsWereCorrect($Playerup.lastTappedButtons, correctButtons)
				$Playerup.isGuessing = false
				$Playerup.isTyping = true
				updateStage()
			elif $Playerup.isTyping == true:
				setCorrectButtons()
				$Playerup.isTyping = false
				$Playerup.isWaiting = true
				changeTurns(2)
				
			elif $Playerup.isWaiting == true:
				return ERR_BUG
		'$Playerdown':
			if $Playerdown.isGuessing == true:
				checkIfButtonsWereCorrect($Playerdown.lastTappedButtons, correctButtons)
				$Playerdown.isGuessing = false
				$Playerdown.isTyping = true
				updateStage()
			elif $Playerdown.isTyping == true:
				setCorrectButtons()
				$Playerdown.isTyping = false
				$Playerdown.isWaiting = true
				changeTurns(1)
				
			elif $Playerdown.isWaiting == true:
				return ERR_BUG
	print(correctButtons)

func setCorrectButtons():
	print("set buttons")
	if whoIsInTurn != null:
		match whoIsInTurn:
			'$Playerup':
				correctButtons = $Playerup.lastTappedButtons.duplicate()
			'$Playerdown':
				correctButtons = $Playerdown.lastTappedButtons.duplicate()

func changeTurns(player:int):
	turnsTaken += 1
	match player:
		1:
			whoIsInTurn = '$Playerup'
			$Playerup.isGuessing = true
			$Playerup.canTap = true
			$Playerdown.canTap = false
			$Playerdown.isWaiting = true
			$Playerdown.deactivate()
			$Playerup.activate()
		2:
			whoIsInTurn = '$Playerdown'
			$Playerup.canTap = false
			$Playerdown.isGuessing = true
			$Playerdown.canTap = true
			$Playerup.isWaiting = true
			$Playerup.deactivate()
			$Playerdown.activate()
		3:
			whoIsInTurn == null
			$Playerup.canTap = false
			$Playerup.isWaiting = true
			$Playerup.isGuessing = false
			$Playerup.isTyping = false
			$Playerdown.canTap = false
			$Playerdown.isWaiting = true
			$Playerdown.isGuessing = false
			$Playerdown.isTyping = false
			$Playerdown.deactivate()
			$Playerup.deactivate()

func endGame():
	if scoreUp > scoreDown:
		GlobalVars.setwinner_up(scoreUp)
		GlobalVars.scoreDown = scoreDown
	elif scoreUp < scoreDown:
		GlobalVars.setwinner_down(scoreDown)
		GlobalVars.scoreUp = scoreUp
	elif scoreUp == scoreDown:
		GlobalVars.setDraw()
		GlobalVars.scoreUp = scoreUp
		GlobalVars.scoreDown = scoreDown
	$Timer.start(.4)

func _on_Playerup_Player_done_Typing() -> void:
	handlePlayer()

func _on_Playerdown_Player_done_Typing() -> void:
	handlePlayer()

func _on_Timer_timeout() -> void:
	BackgroundMusic.volume_db = -13
	SceneTransition.change_scene("res://scenes/End.tscn")
