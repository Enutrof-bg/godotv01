extends CharacterBody2D

signal dead
signal test
var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 1000
	move_and_slide()
	if velocity.length() > 0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
		
	const damage = 5.0	
	var overlapp = %hitbox.get_overlapping_bodies()
	if overlapp.size() > 0:
		health -= damage * overlapp.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			dead.emit()


func _on_dead() -> void:
	%end.visible = true # Replace with function body.
	get_tree().paused = true # Replace with function body.
