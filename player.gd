extends Node2D


@onready var buttonController = $Buttons
@export var amountOfTaps : int = 3


var isInTurn : bool = false
var canTap : bool = true

var tapCooldown : float = 0.5

var tappedButtons = []
var missclicks = 0
signal Player_1_done_setting






func _ready():
	pass


func _process(delta):
	updateButtons()


func updateButtons():
	if isInTurn == true:
		if tappedButtons.size() <= amountOfTaps:
				if canTap == true:
					buttonController.activate()
					$turnIndicator.text = "inTurn"
	else:
		$turnIndicator.text = "NOT inTurn"
	if tappedButtons.size() == amountOfTaps+1:
		emit_signal("Player_1_done_setting")
		tappedButtons.clear()
		isInTurn = false
		canTap = false
		missclicks += 1 
		buttonController.deactivate()

func activate():
	buttonController.activate()



