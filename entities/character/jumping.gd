extends State
class_name Jumping

@export var chimken_sprite: AnimatedSprite2D
@export var chimken_shape: CollisionPolygon2D

func enter() -> void:
	chimken_shape.disabled = false
	chimken_sprite.play("chick_jump")
	await chimken_sprite.animation_finished
	transitioned.emit(self, "chimken")

func exit() -> void:
	pass

func update(_delta: float) -> void:
	if Input.is_action_just_pressed("evolve"):
		transitioned.emit(self, "shitting")

func physics_update(_delta: float) -> void:
	pass
