extends CanvasLayer

@export var BarrelPower: float

func _ready() -> void:
	$ColorRect.material.set_shader_parameter("BarrelPower", BarrelPower)
