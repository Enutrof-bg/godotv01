class_name  MobUI
extends CharacterBody2D

signal reparent_requested(which_mob_ui: MobUI)
@onready var color: ColorRect = $Color
@onready var mob_state_machine: MobStateMachine = $MobStateMachine


var health = randi_range(3, 10)
#var health = 5
const smoke_scene = preload("res://ASSETS/smoke_explosion/smoke_explosion.tscn")
const bullet = preload("res://SCENES/bullet.tscn")
const bullet_target := "player"
var direction
var player

var distance

enum
{
	IDLE,
	WANDER
}
var start_position
var target_position
var state = IDLE
#@onready var player = get_node("/root/ENTITIES/Game/Player")

func _ready():
	player = get_node("/root/Game/ENTITIES/Player")
	#%Slime.play_walk()
	%hp.text = str(health)
	distance = randi_range(0, 800)

func process():
	#%hp.text = "HP : %s" %health
	pass

func _physics_process(_delta):
	direction = global_position.direction_to(player.global_position)
	if distance < abs(global_position.x - player.global_position.x) or distance < abs(global_position.y - player.global_position.y):
	#print(direction)
		velocity = direction * 150
		
	#test
	if (health == 6):
		velocity = direction * 1000
		move_and_slide()
	elif (health == 5):
		match state:
			IDLE:
				#if (%charge.time_left > 0):
					#print("charge")
				#else:
					start_position = player.global_position
					target_position = player.global_position
					#if (%charge.time_left == 0):
					state = WANDER
						#%charge.start()
					
			WANDER:
				#print("wander")
				velocity += direction * 800
				move_and_slide()
				#if ((target_position - start_position).length < 4):
				if (%charge.time_left == 0):
					state = IDLE
					%charge.start()
	else:
		move_and_slide()
	#look_at(global_position)

func state_mode() ->void:
	mob_state_machine.state_mode()	

func take_damage(damage):
	Sigbus.cam_shake.emit()
	health -= damage
	%hp.text = str(health)
	#state_mode()
	print("1233")
	mob_state_machine.state_mode()	
	print("1233")
	#%Slime.play_hurt()
	#mob_state_machine.state_mode()
	if health <= 0:
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
	#print("shoot")
	pass
	#shoot() # Replace with function body.


func _on_charge_timeout() -> void:
	target_position
	pass
	 # Replace with function body.
