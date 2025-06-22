extends State
class_name Egg

@export var character: RigidBody2D
@export var egg_shape: CollisionPolygon2D
@export var egg_sprite: AnimatedSprite2D
@export var particle_emitter: Node2D

@export var initial_speed: float = 300.0
var speed: float

@export var crack_speed_threshold: float = 30.0
var prev_speed: float = 0.0

@export var jump_cooldown = 0.5
var time = 0.0

@export var jump_strenght = 500.0

func enter() -> void:
	egg_shape.disabled = false
	character.physics_material_override.friction = 1.0
	speed = initial_speed
	egg_sprite.play("egg")
	print("eggus maximus")

func exit() -> void:
	egg_shape.disabled = true

func update(delta: float) -> void:
	speed += delta * 50.0
	if Input.is_action_just_pressed("evolve"):
		transitioned.emit(self, "chimken")
	
	time += delta

func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and character.on_floor and time > jump_cooldown:
		character.apply_impulse(Vector2(0.0, -jump_strenght))
		time = 0.0
	character.apply_force(Vector2(speed, 0.0))
	var current_speed: float = character.linear_velocity.length() 
	if prev_speed - current_speed > crack_speed_threshold:
		particle_emitter.emit_egg_shells()
		transitioned.emit(self, "cracking")
	prev_speed = current_speed
	
