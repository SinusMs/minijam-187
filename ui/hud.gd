extends Control


######### screenshake variables
@export var randomShakeStrength: float = 30.0
@export var shakeFade: float = 5.0
var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0
var original_pos: Dictionary = {}
#########

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS 

	# screenshake init
	SignalBus.egg_broke.connect(shake_hud)
	for child in get_children():
		if child is CanvasLayer or child is Node: continue
		original_pos[child] = child.position
	
	
func _process(delta: float) -> void:

	# screenshake test trigger, shake with P
	if Input.is_action_just_pressed("shake"):
		shake_hud()
		print("P -> screen shaking")
	
	# shaking
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shakeFade * delta)
		for child in get_children():
			if child is CanvasLayer:
				continue
			child.position = original_pos[child] + randomOffset()
			
	$GenerationPanel.set_text("Gen: %d" % [Utils.generation])
	$PickupPanel.set_text("%d / %d" % [Utils.current_pickups, Utils.needed_pickups])
	

####### screen shake
func shake_hud() -> void:
	shake_strength = randomShakeStrength
func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
########


	
	
