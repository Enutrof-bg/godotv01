extends Area2D

var travelled := 0
const SPEED := 500
var direction : Vector2
var target : String

func _physics_process(delta) -> void:
	direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	travelled += SPEED * delta


func _on_body_entered(body) -> void:
	if body.has_method("take_damage") and body.is_in_group(target):
		body.take_damage(2)
		queue_free()
	#pass # Replace with function body.


func _on_body_entered_ss2(body) -> void:
	if body.has_method("take_damage") and body.is_in_group(target):
		body.take_damage(1)
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("bullet out")
	queue_free()
