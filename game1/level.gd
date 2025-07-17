extends Node2D

func _ready():
	print("Test")


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("out") # Replace with function body.
	get_tree().reload_current_scene()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("in") # Replace with function body.
