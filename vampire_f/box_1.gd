extends AnimatableBody2D


const SPEED = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x -= SPEED *delta
	if position.x < -650:
		print("box gone")
		queue_free()
