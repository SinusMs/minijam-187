extends State
class_name Egg

@export var character: RigidBody2D
@export var egg_shape: CollisionPolygon2D
@export var egg_sprite: Sprite2D

var speed: float = 300.0

func enter() -> void:
	transitioned.emit(self, "chimken")
	egg_shape.disabled = false
	egg_sprite.visible = true
	character.physics_material_override.friction = 1.0

func exit() -> void:
	egg_shape.disabled = true
	egg_sprite.visible = false

func update(delta: float) -> void:
	speed += delta * 50.0
	if Input.is_action_just_pressed("evolve"):
		transitioned.emit(self, "chimken")

func physics_update(delta: float) -> void:
	character.apply_force(Vector2(speed, 0.0))
