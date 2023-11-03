extends Node2D

var currentMultiplier
var currentStage
var currentCooldown
var currentAmountOfTaps
var whoIsInTurn



@onready var players = [$Playerup,$Playerdown]
@onready var stageIndicator = $StageIndicator


func _ready():
	setStage("I")


func _process(delta):
	controlTurns()


func setStage(text: String):
	stageIndicator.clear()
	stageIndicator.add_text(text)


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


func changeTurns():
	pass
