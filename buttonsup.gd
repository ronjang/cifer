extends Node2D

@onready var button1 = $Button1
@onready var button2 = $Button2
@onready var button3 = $Button3
@onready var button4 = $Button4
@onready var button5 = $Button5
@onready var button6 = $Button6
@onready var ownButtons = get_node("..").get("tappedButtons")




func _ready():
	pass

func _process(delta):
	pass


func _on_button_1_pressed():
	ownButtons.append(1)

func _on_button_2_pressed():
	ownButtons.append(2)

func _on_button_3_pressed():
	ownButtons.append(3)

func _on_button_4_pressed():
	ownButtons.append(4)

func _on_button_5_pressed():
	ownButtons.append(5)

func _on_button_6_pressed():
	ownButtons.append(6)

func activate():
	button1.disabled = false
	button2.disabled = false
	button3.disabled = false
	button4.disabled = false
	button5.disabled = false
	button6.disabled = false

func deactivate():
	button1.disabled = true
	button2.disabled = true
	button3.disabled = true
	button4.disabled = true
	button5.disabled = true
	button6.disabled = true
	
