extends Node2D

var currentMultiplier
var currentStage
var currentCooldown
var currentAmountOfTaps

@onready var players = [$Playerup,$Playerdown]
@onready var stageIndicator = $StageIndicator


func _ready():
	pass # Replace with function body.



func _process(delta):
	setStage()


func setStage():
	stageIndicator.append_text("I")
