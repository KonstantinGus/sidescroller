extends Timer

var elapsed_time: int = 0
@onready var timer_label = $timer_label
@onready var bat_spawner = preload("res://bat_spawner.tscn")
@onready var player = $"../Player"
@onready var box_spawner = $"../boxSpawner"


# Called when the node enters the scene tree for the first time.
func _ready():
	wait_time = 1.0
	one_shot = false
	autostart = true
	timeout.connect(_on_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timeout():
	elapsed_time +=1
	timer_label.text = format_time(elapsed_time)
	
	
	if elapsed_time == 60:
		MoreSpawns()
		timer_label.modulate = Color(0.0, 0.9, 0.0)
		
	if elapsed_time == 120:
		SpeedUp()
		timer_label.modulate = Color(1.0, 0.5, 0.0)

	if elapsed_time == 180:
		MoreSpawns()
		timer_label.modulate = Color(0.7, 0.0, 0.0)
		
	
	
func format_time(seconds: int) ->String:
	var minutes = seconds / 60
	var secs = seconds % 60
	return "%02d:%02d" % [minutes, secs]
	


func SpeedUp():
	Global.BackgroundSpeed = Global.BackgroundSpeed *2
	player.BackgroundVelocity = Global.BackgroundSpeed * -1
	box_spawner.timer.wait_time = 1.5

	
	
func MoreSpawns():
	var spawner = bat_spawner.instantiate()
	get_parent().add_child(spawner)
	
