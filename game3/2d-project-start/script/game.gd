extends Node2D

func _ready():
	spawn()

func spawn():
	var newmob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	newmob.global_position = %PathFollow2D.global_position
	add_child(newmob)


func _on_timer_timeout() -> void:
	spawn() # Replace with function body.
	#spawn()
	#spawn()
	#pass


func _on_player_dead() -> void:
	%end.visible = true # Replace with function body.
	get_tree().paused = true
