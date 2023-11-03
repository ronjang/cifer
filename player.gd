extends Node2D


@onready var buttonController = $Buttons
@export var amountOfTaps : int = 3


var isInTurn : bool = false
var canTap : bool = true

var tapCooldown : float = 0.5

var tappedButtons = []
var tries = 0







func _ready():
	pass


func _process(delta):
	updateButtons()


func updateButtons():
	if isInTurn == true:
		if tappedButtons.size() <= amountOfTaps:
				isInTurn = true
				if canTap == true:
					buttonController.activate()
	if tappedButtons.size() == amountOfTaps+1:
		tappedButtons.clear()
		isInTurn = false
		canTap = false
		tries += 1 
		buttonController.deactivate()








func activate():
	buttonController.activate()
