extends Timer

var elapsed_time: int = 0
@onready var timer_label = $timer_label

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
	
func format_time(seconds: int) ->String:
	var minutes = seconds / 60
	var secs = seconds % 60
	return "%02d:%02d" % [minutes, secs]
