extends State
class_name Jumping

@export var character: RigidBody2D
@export var chimken_sprite: AnimatedSprite2D
@export var chimken_shape: CollisionShape2D

func enter() -> void:
	SignalBus.connect("trigger_persuer", _on_trigger_persuer)
	chimken_shape.disabled = false
	chimken_sprite.play("chick_jump")
	await chimken_sprite.animation_finished
	transitioned.emit(self, "chimken")

func exit() -> void:
	pass

func update(_delta: float) -> void:
	if Input.is_action_just_pressed("evolve") and character.can_shit == true:
		transitioned.emit(self, "shitting")

func physics_update(_delta: float) -> void:
	pass
	
func _on_trigger_persuer():
	transitioned.emit(self, "persuerevent")
	if Input.is_action_pressed("left"):
		character.apply_central_force(Vector2(-character.move_speed, 0.0))
	if Input.is_action_pressed("right"):
		character.apply_central_force(Vector2(character.move_speed, 0.0))
