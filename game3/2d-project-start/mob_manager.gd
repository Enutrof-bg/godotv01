extends Node

func _ready():
	spawn()

func spawn():
	var newmob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	newmob.global_position = %PathFollow2D.global_position
	add_child(newmob)

func _on_timer_timeout() -> void:
	spawn()
