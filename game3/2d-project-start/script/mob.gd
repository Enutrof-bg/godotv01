extends CharacterBody2D

var health = randi_range(3, 10)
const smoke_scene = preload("res://smoke_explosion/smoke_explosion.tscn")
const bullet = preload("res://bullet.tscn")
const bullet_target := "player"
var direction
var player

#@onready var player = get_node("/root/ENTITIES/Game/Player")

func _ready():
	player = get_node("/root/Game/ENTITIES/Player")
	#%Slime.play_walk()
	%hp.text = str(health)

func process():
	#%hp.text = "HP : %s" %health
	pass

func _physics_process(_delta):
	direction = global_position.direction_to(player.global_position)
	#print(direction)
	velocity = direction * 150
	#look_at(global_position)
	move_and_slide()


func take_damage(damage):
	health -= damage
	%hp.text = str(health)
	#%Slime.play_hurt()
	
	if health == 0:
		var smoke = smoke_scene.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		queue_free()


#func shoot():
	#var newBullet = bullet.instantiate()
	#newBullet.global_position = %shootpoint.global_position
	#newBullet.global_rotation = %shootpoint.global_rotation
	#%shootpoint.add_child(newBullet)

func _on_timer_timeout():
	print("shoot")
	#shoot() # Replace with function body.
