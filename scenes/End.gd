extends Control


var scene = preload("res://scenes/Selection.tscn")

func _process(delta: float) -> void:
	setGameovertext()


func _on_TextureButton_pressed():
	$StartSound.play(0)
	$Timer.start(.4)
	$AnimationPlayer.play("buttonAnim")
	$Control/CiferMenutext.rotSpeed = 1.5


func _on_Timer_timeout():
	SceneTransition.change_scene_to(scene)


func setGameovertext():
	if GlobalVars.winner == "up":
		$Background/Up/endText.text = "you won!\nscore: " + str(GlobalVars.scoreUp)
		$Background/Down/endText.text = "you lost :(\nscore: " + str(GlobalVars.scoreDown)
	if GlobalVars.winner == "down":
		$Background/Up/endText.text = "you won!\nscore: " + str(GlobalVars.scoreDown)
		$Background/Down/endText.text = "you lost :(\nscore: " + str(GlobalVars.scoreUp)
	if GlobalVars.winner == "draw":
		$Background/Up/endText.text = "it's a draw! :O\nscore: " + str(GlobalVars.scoreDown)
		$Background/Down/endText.text = "it's a draw! :O\nscore: " + str(GlobalVars.scoreUp)
