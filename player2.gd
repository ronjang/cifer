extends Node2D


@onready var buttonController = $Buttons
@export var amountOfTaps : int = 3


var isInTurn : bool = false
var canTap : bool

var tapCooldown : float = 0.5

var tappedButtons = []
var missclicks = 0
signal Player_2_done_setting






func _ready():
	pass


func _process(delta):
	updateButtons()


func updateButtons():
	if isInTurn == true:
		if tappedButtons.size() <= amountOfTaps:
				if canTap == true:
					$turnIndicator.text = "inTurn"
					activate()
	else:
		$turnIndicator.text = "NOT inTurn"
	if tappedButtons.size() == amountOfTaps+1:
		Player_2_done_setting.emit()
		tappedButtons.clear()
		isInTurn = false
		canTap = false
		deactivate()

func activate():
	buttonController.activate()

func deactivate():
	buttonController.deactivate()



