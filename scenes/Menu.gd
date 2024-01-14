extends Control

var scene = preload("res://scenes/Selection.tscn")




func _on_TextureButton_pressed():
	$Timer.start(.4)
	$AnimationPlayer.play("buttonAnim")
	$Control/CiferMenutext.rotSpeed = 1.5


func _on_Timer_timeout():
	SceneTransition.change_scene_to(scene)
