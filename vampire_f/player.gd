extends CharacterBody2D

@onready var rect_color = $ColorRect
@onready var jump_sound = $JumpSound
@onready var death_sound = $DeathSound

	

var SPEED = 300
const spdSlowed = 30
var JUMP_VELOCITY = -500.0
const jumpSlowed = -100
var BackgroundVelocity = Global.BackgroundSpeed * -1

const MAX_JUMPS = 2

var jumps_left = MAX_JUMPS


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumps_left = MAX_JUMPS

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1
		jump_sound.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("go_left", "go_right")
	if direction:
		velocity.x = BackgroundVelocity + direction * SPEED
	else:
		velocity.x = BackgroundVelocity

	move_and_slide()
	




func _on_killzone_body_entered(body):
	if body == self:
		print("you died...")
		var timer_node = get_tree().root.get_node("Main/ScoreTimer")
		Global.final_time = timer_node.elapsed_time
		get_tree().change_scene_to_file("res://game_over.tscn")
		
	

func apply_stun():
	print("bat touch2")
	death_sound.play()
	rect_color.color = Color(0.5, 0, 0.1, 1)
	SPEED = spdSlowed
	JUMP_VELOCITY = jumpSlowed
	await get_tree().create_timer(3.0).timeout
	SPEED = 300
	JUMP_VELOCITY = -500 
	rect_color.color =Color(0, 0, 1, 1)
	
