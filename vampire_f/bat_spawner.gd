extends Node2D

@export var box_scene: PackedScene = preload("res://bat_3.tscn")
@export var spawn_interval: float = 0.5  # seconds between spawns
@export var spawn_x: float = 800  # X position to spawn (offscreen right)
@export var min_y: float = -200
@export var max_y: float = 200



var timer: Timer

func _ready():
	print("new batspawner")
	# Create a Timer
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.one_shot = false
	timer.start()
	timer.timeout.connect(_spawn_bat)  # connect to _spawn_bat

func _spawn_bat():
	var bat = box_scene.instantiate()
	# Random Y within range
	var y_pos = randf_range(min_y, max_y)
	bat.position = Vector2(spawn_x, y_pos)  # use bat instead of box
	get_parent().add_child(bat)
