extends Sprite

var rotSpeed = .1

func _physics_process(delta):
	rotation_degrees += rotSpeed
