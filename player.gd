extends Node2D



@onready var button1 = $Button1
@onready var button2 = $Button2
@onready var button3 = $Button3
@onready var button4 = $Button4
@onready var button5 = $Button5
@onready var button6 = $Button6
@export var taplength : int = 3
@export var hp : int = 3
var isinturn : bool = false
var cantap : bool = false
var tapcooldown : float = 0.5
var tappedbuttons = []






func _ready():
	pass




func _process(delta):
	pass




func _on_button_1_pressed():
	tappedbuttons.append(1)
	print(tappedbuttons)
