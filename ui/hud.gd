extends CanvasLayer


######### screenshake variables
@export var randomShakeStrength: float = 30.0
@export var shakeFade: float = 5.0
var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0
var original_pos: Dictionary = {}
#########

@onready var generation_panel: Panel = $GenerationPanel
@onready var pickup_panel: Panel = $PickupPanel
@onready var you_died_panel: Panel = $YouDiedPanel

func _ready() -> void:
	you_died_panel.visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS 
	SignalBus.unalived.connect(on_unalived)
	# screenshake init
	SignalBus.egg_broke.connect(shake_hud)
	for child in get_children():
		if child is not CanvasLayer and child is not AudioStreamPlayer2D:
			original_pos[child] = child.position

func _process(delta: float) -> void:
	# screenshake test trigger, shake with P
	if Input.is_action_just_pressed("shake"):
		shake_hud(Vector2.ZERO)
		print("P -> screen shaking")
	
	# shaking
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shakeFade * delta)
		for child in get_children():
			if child is not CanvasLayer and child is not AudioStreamPlayer2D:
				child.position = original_pos[child] + randomOffset()
				
			
	generation_panel.set_text("Gen: %d" % [Utils.generation])
	pickup_panel.set_text("%d / %d" % [Utils.current_pickups, Utils.needed_pickups])
	

####### screen shake
func shake_hud(_pos: Vector2) -> void:
	shake_strength = randomShakeStrength
func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
########


func on_unalived():
	you_died_panel. visible = true


func _on_return_button_pressed() -> void:
	SignalBus.restart_game.emit()
	pass # Replace with function body.
