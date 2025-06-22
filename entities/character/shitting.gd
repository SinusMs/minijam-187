extends State
class_name Shitting

@export var chimken_sprite: AnimatedSprite2D
@export var character: RigidBody2D
@export var chimken_shape: CollisionShape2D

func enter() -> void:
	$"../../Shit_SFX".play()
	chimken_shape.disabled = false
	chimken_sprite.play("shit")
	var tween = get_tree().create_tween()
	tween.tween_property(chimken_sprite, "position", Vector2(5 * sign(character.linear_velocity.x), -7), 0.4)
	await chimken_sprite.animation_finished
	chimken_sprite.position = Vector2(0, 0)
	Utils.generation += 1
	transitioned.emit(self, "egg")
	SignalBus.SwapShaderEffect.emit()


func exit() -> void:
	character.can_shit = false
	character.shit_amount = character.initial_shit_amount
	chimken_shape.disabled = true

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
