extends Control
class_name HUD

@export var stopwatch_label: Label

var stopwatch: Stopwatch

######### screenshake variables
@export var randomShakeStrength: float = 30.0
@export var shakeFade: float = 5.0
var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0
var original_pos: Dictionary = {}
#########

func _ready() -> void:
	stopwatch = get_tree().get_first_node_in_group("stopwatch")
	
	# screenshake init
	SignalBus.egg_broke.connect(shake_hud)
	for child in get_children():
			original_pos[child] = child.position
	
	
func _process(delta: float) -> void:
	update_stopwatch_label()
	
	# screenshake trigger, shake with P
	if Input.is_action_just_pressed("shake"):
		shake_hud()
		print("asdf")
		
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shakeFade * delta)
		for child in get_children():
			child.position = original_pos[child] + randomOffset()
	
	
func update_stopwatch_label() -> void:
	# stopwatch_label.text = stopwatch.time_to_string()
	pass

######## screen shake
func shake_hud() -> void:
	shake_strength = randomShakeStrength
func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
########
	
	
