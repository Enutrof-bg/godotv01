extends Area2D

const bullet_left = preload("res://SCENES/bullet.tscn")
const bullet_right = preload("res://SCENES/bullet2.tscn")
const target := "mob"
const BULLET_LABEL := preload("res://RESSOURCES/bullet_player.tres")

func _process(_delta):
	if Input.is_action_pressed("shoot"):
		if (%Timer.time_left > 0):
			print("cooldown gun")
		else:
			shoot()
			%Timer.start()
	if Input.is_action_pressed("shoot2"):
		if (%Timer.time_left > 0):
			print("cooldown gun")
		else:
			shoot2()
			%Timer.start()

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
	newBullet.label.label_settings = BULLET_LABEL

func shoot2():
	var newBullet = bullet_right.instantiate()
	newBullet.global_position = %ShootingPoint.global_position
	newBullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(newBullet)
	newBullet.target = target
	#newBullet.label.label_settings = BULLET_LABEL


func _on_timer_timeout():
	#shoot() # Replace with function body.
	pass
