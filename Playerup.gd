extends Node2D


@onready var buttonController = $Buttons
@export var amountOfTaps : int = 3


var isInTurn : bool
var isGuessing : bool
var isSetting : bool
var isWaiting : bool
var canTap : bool

var tapCooldown : float = 0.5

var tappedButtons = []
var missclicks = 0
signal Player_done_setting






func _ready():
	pass


func _process(delta):
	updateButtons()
	updateTurnIndicator()


func updateButtons():
	if tappedButtons.size() <= amountOfTaps:
			if canTap == true:
				$TurnIndicator.text = "inTurn"
	if tappedButtons.size() == amountOfTaps:
		Player_done_setting.emit()
		tappedButtons.clear()
		canTap = false

func updateTurnIndicator():
	if isInTurn == true:
		$TurnIndicator.text = "inTurn"
	else:
		if isInTurn == false:
			$TurnIndicator.text = "NOT inTurn"

func activate():
	buttonController.activate()

func deactivate():
	buttonController.deactivate()



