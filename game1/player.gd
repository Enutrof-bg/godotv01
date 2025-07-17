extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#apply_impulse(Vector2(125,-50))# Replace with function body.

func _process(float):
	#apply_impulse(Vector2(15,15))
	#apply_force(Vector2(-10,-15))
	#print(Engine.get_frames_per_second())
	pass
	
func _physics_process(delta):
	if Input.is_action_just_pressed("move_right"):
		apply_central_impulse(Vector2(150,0))
	if Input.is_action_just_pressed("move_left"):
		apply_central_impulse(Vector2(-150,0))
	if Input.is_action_just_pressed("move_up"):
		apply_central_impulse(Vector2(0,-300))
	if Input.is_action_just_pressed("move_down"):
		apply_central_impulse(Vector2(0,150))
	#pass
