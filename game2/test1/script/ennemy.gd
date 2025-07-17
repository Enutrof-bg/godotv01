extends Area2D

@export var speed = 300
@onready var visiblenotifennemy = $VisibleOnScreenNotifier2D

func _ready():
	visiblenotifennemy.connect("screen_exited", _ennemy_exited)

func _physics_process(delta):
	global_position.x += -speed * delta

func _ennemy_exited():
	queue_free()
