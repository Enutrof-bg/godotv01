extends Node2D

#var newmob = preload("res://mob.tscn")



func _on_player_dead() -> void:
	%end.visible = true # Replace with function body.
	get_tree().paused = true
