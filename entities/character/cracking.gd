extends State
class_name Cracking

@export var egg_sprite: AnimatedSprite2D
@export var character: RigidBody2D
@export var chimken_shape: CollisionShape2D

func enter() -> void:
	chimken_shape.disabled = false
	egg_sprite.play("splat")
	character.rotation = 0.0
	SignalBus.egg_broke.emit(character.global_position)
	await egg_sprite.animation_finished
	transitioned.emit(self, "chimken")

func exit() -> void:
	chimken_shape.disabled = true

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
