extends Control

var scene = preload("res://scenes/Selection.tscn")
var stream = preload("res://assets/sounds/soundtrack_density_and_time_maze.mp3")



func _on_TextureButton_pressed():
	$StartSound.play(0)
	$Timer.start(.4)
	$AnimationPlayer.play("buttonAnim")
	$Control/CiferMenutext.rotSpeed = 1.5


func _on_Timer_timeout():
	SceneTransition.change_scene_to(scene)
