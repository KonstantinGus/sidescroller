extends Control

@onready var restart_timer = $restartTimer

@onready var final_label = $FinalTimeLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	var minutes = Global.final_time / 60
	var seconds = Global.final_time % 60
	final_label.text = "Your Time: %02d:%02d" % [minutes, seconds]
	Global.BackgroundSpeed = 100
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("restart"):
		
		set_process(false)
		restart_timer.start()

func _on_restart_timer_timeout():
	get_tree().change_scene_to_file("res://main.tscn")
