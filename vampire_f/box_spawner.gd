extends Node2D

@export var box_scene: PackedScene = preload("res://box_1.tscn")
@export var spawn_interval: float = 3  # seconds between spawns
@export var spawn_x: float = 800  # X position to spawn (offscreen right)
@export var min_y: float = 50
@export var max_y: float = 300

var timer: Timer

func _ready():
	# Create a Timer
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.one_shot = false
	timer.start()
	timer.timeout.connect(_spawn_box)

func _spawn_box():
	var box = box_scene.instantiate()
	# Random Y within range
	var y_pos = randf_range(min_y, max_y)
	box.position = Vector2(spawn_x, y_pos)
	get_parent().add_child(box)
