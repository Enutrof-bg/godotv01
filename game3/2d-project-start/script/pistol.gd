extends Area2D

func _process(delta):
	if Input.is_action_just_released("shoot"):
		shoot()
	if Input.is_action_just_released("shoot2"):
		shoot2()
			
func _physics_process(delta):
		var ennemies_in_range = get_overlapping_bodies()
		#if ennemies_in_range.size() > 0:
		#	var target_ennemy = ennemies_in_range.front()
		#	look_at(target_ennemy.global_position)
		look_at(get_global_mouse_position())
		

func shoot():
	const bullet = preload("res://bullet.tscn")
	var newBullet = bullet.instantiate()
	newBullet.global_position = %ShootingPoint.global_position
	newBullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(newBullet)

func shoot2():
	const bullet = preload("res://bullet2.tscn")
	var newBullet = bullet.instantiate()
	newBullet.global_position = %ShootingPoint.global_position
	newBullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(newBullet)

func _on_timer_timeout():
	#shoot() # Replace with function body.
	pass
