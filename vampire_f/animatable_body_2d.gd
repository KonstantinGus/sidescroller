extends AnimatableBody2D


const SPEED = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x -= SPEED *delta
