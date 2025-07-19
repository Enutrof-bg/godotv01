extends Area2D

const bullet_left = preload("res://bullet.tscn")
const bullet_right = preload("res://bullet2.tscn")
const target := "mob"

func _process(_delta):
	if Input.is_action_just_released("shoot"):
		shoot()
	if Input.is_action_just_released("shoot2"):
		shoot2()

func _physics_process(_delta):
		#if ennemies_in_range.size() > 0:
			#var target_ennemy = ennemies_in_range.front()
			#look_at(target_ennemy.global_position)
		look_at(get_global_mouse_position())

func shoot():
	var newBullet = bullet_left.instantiate()
	newBullet.global_position = %ShootingPoint.global_position
	newBullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(newBullet)
	newBullet.target = target

func shoot2():
	var newBullet = bullet_right.instantiate()
	newBullet.global_position = %ShootingPoint.global_position
	newBullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(newBullet)
	newBullet.target = target


func _on_timer_timeout():
	#shoot() # Replace with function body.
	pass
