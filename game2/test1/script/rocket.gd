extends Area2D

@export var speed = 2
#var speed = 2

func _physics_process(_delta):
	#global_position.x = global_position.x + 2
	global_position.x += speed
