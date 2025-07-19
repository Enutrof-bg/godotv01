extends Area2D

const bullet = preload("res://bullet.tscn")
const target := "player"
var direction
var player

func _ready() -> void:
	player = get_node("/root/Game/ENTITIES/Player")

func _physics_process(_delta):
	#func autoaim()
	#direction = global_position.direction_to(player.global_position)
	look_at(player.global_position)
	#print(direction)

func shoot():
	var newBullet = bullet.instantiate()
	newBullet.global_position = %ShootingPoint.global_position
	newBullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(newBullet)
	newBullet.target = target

#func shoot2():
	#const bullet = preload("res://bullet2.tscn")
	#var newBullet = bullet.instantiate()
	#newBullet.global_position = %ShootingPoint.global_position
	#newBullet.global_rotation = %ShootingPoint.global_rotation
	#%ShootingPoint.add_child(newBullet)


#func autoaim() -> void:
	#var ennemies_in_range = get_overlapping_bodies()
	#if ennemies_in_range.size() > 0:
		#var target_ennemy = ennemies_in_range.front()
		#look_at(target_ennemy.global_position)

func _on_timer_timeout():
	shoot() # Replace with function body.
	#pass
