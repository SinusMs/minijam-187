extends State
class_name Chimken

@export var character: RigidBody2D
@export var chimken_shape: CollisionShape2D
@export var chimken_sprite: AnimatedSprite2D
@export var particle_emitter: Node2D

@export var chimken_max_speed: int = 200;
@export var chimken_weight: float = 200;


# for double jump 0 -> no double jump
@export var jump_amount: int = 1
var jump_counter: int

@export var jump_cooldown = 0.3
var time = 0.0

@export var jump_strenght = 500.0

var connected = false

func enter() -> void:
	if not connected:
		SignalBus.connect("trigger_persuer", _on_trigger_persuer)
		connected = true
	chimken_shape.disabled = false
	character.physics_material_override.friction = 0.1
	jump_counter = jump_amount
	$"../..".max_speed = chimken_max_speed
	$"../..".mass = chimken_weight
	chimken_sprite.play("chick_idle")

func exit() -> void:
	chimken_shape.disabled = true
	character.rotation_degrees = 0.0

func update(delta: float) -> void:
	if Input.is_action_just_pressed("evolve") and character.can_shit == true:
		transitioned.emit(self, "shitting")
	if character.on_floor:
		jump_counter = jump_amount
	time += delta

func physics_update(_delta: float) -> void:
	var current_speed: float = character.linear_velocity.length()
	
	if abs(character.linear_velocity.x) > 10.0:
		chimken_sprite.scale.x = sign(character.linear_velocity.x)
	
	# jumping
	if Input.is_action_just_pressed("jump") and jump_counter > 0 and time > jump_cooldown:
		#character.apply_impulse(Vector2(0.0, -jump_strenght))
		character.linear_velocity.y = -jump_strenght
		jump_counter -= 1
		time = 0.0
		particle_emitter.emit_feathers()
		transitioned.emit(self, "jumping")
	
	if character.on_floor_currently:
		if current_speed > 100.0:
			chimken_sprite.play("chick_run")
		else:
			chimken_sprite.play("chick_idle")
	
	if Input.is_action_pressed("left"):
		character.apply_central_force(Vector2(-character.move_speed, 0.0))
	if Input.is_action_pressed("right"):
		character.apply_central_force(Vector2(character.move_speed, 0.0))
	
	# aufrichten wenn umgefallen
	var rot: float = character.rotation_degrees
	if rot < -10 or rot > 10:
		character.apply_force(Vector2(rot * 0.5, 0.0), Vector2(0.0, 500.0))

func _on_trigger_persuer():
	print("grr")
	transitioned.emit(self, "persuerevent")
