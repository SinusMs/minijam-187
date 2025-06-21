extends State
class_name Chimken

@export var character: RigidBody2D
@export var chimken_shape: CollisionPolygon2D
@export var chimken_sprite: Sprite2D

func enter() -> void:
	chimken_shape.disabled = false
	chimken_sprite.visible = true
	character.physics_material_override.friction = 0.1

func exit() -> void:
	chimken_shape.disabled = true
	chimken_sprite.visible = false
	character.rotation_degrees = 0.0

func update(delta: float) -> void:
	if Input.is_action_just_pressed("evolve"):
		transitioned.emit(self, "egg")

func physics_update(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		print("chump")
		character.apply_impulse(Vector2(0.0, -500.0))
	if Input.is_action_pressed("left"):
		character.apply_central_force(Vector2(-500.0, 0.0))
	if Input.is_action_pressed("right"):
		character.apply_central_force(Vector2(500.0, 0.0))
	
	var rot: float = character.rotation_degrees
	if rot < -45 or rot > 45:
		character.apply_force(Vector2(rot, 0.0), Vector2(0.0, 1000.0))
