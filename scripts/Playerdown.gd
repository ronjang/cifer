extends Control


onready var buttonController = $Buttons
export var amountOfTaps : int = 3


var isGuessing : bool
var isTyping : bool
var isWaiting : bool
var canTap : bool

var tapCooldown : float = 0.5

var tappedButtons = []
var lastTappedButtons = []
var missclicks = 0
signal Player_done_Typing






func _ready():
	pass


func _process(delta):
	updateButtons()
	updateTurnIndicator()


func updateButtons():
	if tappedButtons.size() == amountOfTaps:
		lastTappedButtons = tappedButtons.duplicate()
		emit_signal("Player_done_Typing")
		tappedButtons.clear()
		canTap = false

func updateTurnIndicator():
	if isGuessing == true:
		$TurnIndicator.text = "guessing"
	elif isTyping == true:
			$TurnIndicator.text = "typing"
	elif isWaiting == true:
			$TurnIndicator.text = "waiting.."

func activate():
	buttonController.activate()

func deactivate():
	buttonController.deactivate()



