extends Control


var scene = preload("res://scenes/World.tscn")



func _on_Button2_pressed():
	SceneTransition.change_scene_to(scene)
