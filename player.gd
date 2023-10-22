extends Node2D



@export var amountOfTaps : int = 3
@export var hp : int = 3
var isInTurn : bool = false
var canTap : bool = false
var tapCooldown : float = 0.5
var tappedButtons = []






func _ready():
	pass


func _process(delta):
	pass


func updateButtons():
	if canTap == true:
		pass

func getTappedButtons():
	return tappedButtons
