extends Control

onready var button1 = get_node("VBox1/Button1")
onready var button2 = get_node("VBox1/Button2")
onready var button3 = get_node("VBox1/Button3")
onready var button4 = get_node("VBox2/Button4")
onready var button5 = get_node("VBox2/Button5")
onready var button6 = get_node("VBox2/Button6")
onready var ownButtons = get_node("..").get("tappedButtons")
onready var sound = get_node("..").get_node("..").get_node("Sounds")
onready var animationPlayer = get_node("AnimationPlayer")



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
	




func _on_Button1_pressed():
	ownButtons.append(1)
	animationPlayer.play("buttonTap1")
	sound.get_node("Button1").play()


func _on_Button2_pressed():
	ownButtons.append(2)
	animationPlayer.play("buttonTap2")
	sound.get_node("Button2").play()


func _on_Button3_pressed():
	ownButtons.append(3)
	animationPlayer.play("buttonTap3")
	sound.get_node("Button3").play()


func _on_Button4_pressed():
	ownButtons.append(4)
	animationPlayer.play("buttonTap4")
	sound.get_node("Button4").play()


func _on_Button5_pressed():
	ownButtons.append(5)
	animationPlayer.play("buttonTap5")
	sound.get_node("Button5").play()


func _on_Button6_pressed():
	ownButtons.append(6)
	animationPlayer.play("buttonTap6")
	sound.get_node("Button6").play()


