extends CharacterBody2D  # or Area2D if you prefer

const SPEED = 200

@export var stun_duration := 1.5  # seconds of stun to player

func _physics_process(delta):
	# Move left
	position.x -= SPEED * delta

	# Remove if offscreen
	if position.x < -650:
		queue_free()

# Detect collision with player
func _on_enemy_body_entered(body):
	if body.is_in_group("player"):
		body.stun(stun_duration)  # call stun function on player
		# enemy keeps moving, doesn’t stop
