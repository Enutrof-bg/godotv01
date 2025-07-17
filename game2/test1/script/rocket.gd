extends Area2D

@export var speed = 2
#var speed = 2
@onready var visiblenotif = $VisibleOnScreenNotifier2D

func _ready():
	visiblenotif.connect("screen_exited", _on_screen_exited)
	
func _physics_process(delta):
	#global_position.x = global_position.x + 2
	global_position.x += speed*delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	pass # Replace with function body.


func _on_screen_exited():
	queue_free()
