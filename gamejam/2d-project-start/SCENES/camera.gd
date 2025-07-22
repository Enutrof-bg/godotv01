extends Camera2D

var random_strength := 4.0
var shake_strength := 0.0
var fade := 5.0
var rng = RandomNumberGenerator.new()
const BASE_OFFSET := Vector2(1920/2.0, 1080/2.0)

func _ready() -> void:
	Sigbus.cam_shake.connect(apply_shake)

func apply_shake() -> void:
	shake_strength = random_strength

func _physics_process(delta: float) -> void:
	offset = BASE_OFFSET + random_offset()
	
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, fade * delta)

func random_offset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
