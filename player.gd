extends Node2D


@onready var buttonController = $buttons
@export var amountOfTaps : int = 3
@export var hp : int = 3
var isInTurn : bool = false
var canTap : bool = true
var tapCooldown : float = 0.5
var tappedButtons = []







func _ready():
	pass


func _process(delta):
	updateButtons()


func updateButtons():
	if tappedButtons.size() <= amountOfTaps:
			isInTurn = true
			if canTap == true:
				buttonController.activate()
	if tappedButtons.size() == amountOfTaps+1:
		tappedButtons.clear()
		isInTurn = false
		canTap = false
		buttonController.deactivate()



