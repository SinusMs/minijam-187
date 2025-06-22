extends CanvasLayer

@export var rect: ColorRect
@export var persuer: Node2D
@export var gloomyness: float
@export var animation_player: AnimationPlayer
@export var prompt: Sprite2D
@export var fightable: bool = false

signal survived
signal trigger_persuer

var shader

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	prompt.modulate = Color(1,1,1,0)
	process_mode = Node.PROCESS_MODE_ALWAYS 
	SignalBus.connect("trigger_persuer", _on_trigger_persuer)
	gloomyness = 0.0
	persuer.visible = false
	shader = rect.material
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	shader.set_shader_parameter("grrr", gloomyness)
	if fightable:
		if Input.is_action_just_pressed("fight"):
			animation_player.stop()
			animation_player.play("persuer_fugged")
			fightable = false
			
	pass


func _on_trigger_persuer() -> void:
	persuer.visible = true
	animation_player.play("gefährliche_animation")
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	prompt.modulate = Color(1,1,1,0)
	
	if(anim_name == "gefährliche_animation"):
		gloomyness = 0.0
		print("you ded")
		SignalBus.emit_signal("unalived")
		#animation_player.play("persuer_fugged")
		
	elif(anim_name == "persuer_fugged"):
		persuer.visible = false
		SignalBus.emit_signal("survived_persuer")
	pass # Replace with function body.
