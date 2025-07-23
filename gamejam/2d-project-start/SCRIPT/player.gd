extends CharacterBody2D

signal dead
var health := 100.0
const damage := 5.0
const SPEED := 30000
var overlapp
var direction : Vector2

const bullet_target := "mob"

func _physics_process(delta):
	#print("POSITION = ", global_position)
	move(delta)
	animate()
	#check_hit(delta)

func move(delta) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED * delta
	move_and_slide()

func animate() -> void:
	if velocity.length() > 0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()

#func check_hit(delta) -> void:
	#overlapp = %hitbox.get_overlapping_bodies()
	#if overlapp.size() > 0:
		#health -= damage * overlapp.size() * delta
		#%ProgressBar.value = health
		#if health <= 0.0:
			#dead.emit()

func _on_dead() -> void:
	%end.visible = true # Replace with function body.
	get_tree().paused = true # Replace with function body.

func take_damage(_damage) -> void:
	print("PLAYER TOUCHED")
	health -= damage
	%ProgressBar.value = health
	if health <= 0:
		dead.emit()
