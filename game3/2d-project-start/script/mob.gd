extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")

func _ready():
	player = get_node("/root/Game/Player")
	%Slime.play_walk()
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
#a	print(directiona)
	velocity = direction * 150
	move_and_slide()


func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()
		const smoke_scene = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = smoke_scene.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
