extends Area2D

var travelled = 0

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	travelled += SPEED * delta
	if travelled > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(2)
	#pass # Replace with function body.


func _on_body_entered_ss2(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(1)
		 # Replace with function body.
