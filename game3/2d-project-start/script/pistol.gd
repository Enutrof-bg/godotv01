extends Area2D

func _physics_process(delta):
		var ennemies_in_range = get_overlapping_bodies()
		if ennemies_in_range.size() > 0:
			var target_ennemy = ennemies_in_range.front()
			look_at(target_ennemy.global_position)

func shoot():
	const bullet = preload("res://bullet.tscn")
	var newBullet = bullet.instantiate()
	newBullet.global_position = %ShootingPoint.global_position
	newBullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(newBullet)


func _on_timer_timeout():
	shoot() # Replace with function body.
