extends Area2D  # or Area2D if you prefer

var SPEED = Global.BackgroundSpeed *2 


	
	
func _physics_process(delta):
	# Move left
	position.x -= SPEED * delta

	# Remove if offscreen
	if position.x < -650:
		queue_free()
		print("bat gone")

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("bat touch")
		body.apply_stun()
