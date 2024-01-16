extends Control


var scene = preload("res://scenes/World.tscn")



func _on_Button2_pressed():
	$AnimationPlayer.play("buttonAnim2")
	$ButtonSound.play(0)
	$Timer.start(.2)




func _on_Button1_pressed() -> void:
	$AnimationPlayer.play("buttonAnim")
	$ButtonSound.play(0)


func _on_Timer_timeout() -> void:
	SceneTransition.change_scene_to(scene)
