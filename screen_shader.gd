extends CanvasLayer

@export var rect: ColorRect
@export var persuer: Node2D
@export var gloomyness: float
@export var animation_player: AnimationPlayer

signal trigger_persuer
signal survived

var shader


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gloomyness = 0.0
	#persuer.visible = false
	shader = rect.material
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	shader.set_shader_parameter("grrr", gloomyness)
	print(shader.get_shader_parameter("grrr"))
	pass


func _on_trigger_persuer() -> void:
	persuer.visible = true
	animation_player.play("gefährliche_animation")
	pass # Replace with function body.




func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "gefährliche_animation"):
		gloomyness = 0.0
		animation_player.play("persuer_fugged")
		
	elif(anim_name == "persuer_fugged"):
		persuer.visible = false
	pass # Replace with function body.
