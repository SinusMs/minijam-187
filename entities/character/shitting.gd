extends State
class_name Shitting

@export var chimken_sprite: AnimatedSprite2D
@export var character: RigidBody2D
@export var chimken_shape: CollisionPolygon2D

func enter() -> void:
	chimken_shape.disabled = false
	chimken_sprite.play("shit")
	var tween = get_tree().create_tween()
	tween.tween_property(chimken_sprite, "position", Vector2(5 * sign(character.linear_velocity.x), -7), 0.4)
	await chimken_sprite.animation_finished
	chimken_sprite.position = Vector2(0, 0)
	transitioned.emit(self, "egg")

func exit() -> void:
	character.can_shit = false
	character.shit_amount = character.initial_shit_amount
	chimken_shape.disabled = true

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
