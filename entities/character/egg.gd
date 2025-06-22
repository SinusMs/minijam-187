extends State
class_name Egg

@export var character: RigidBody2D
@export var egg_shape: CollisionShape2D
@export var egg_sprite: AnimatedSprite2D
@export var particle_emitter: Node2D

@export var egg_max_speed: int = 9999999;
@export var egg_weight: float = 100;

@export var initial_speed: float = 300.0
var speed: float

@export var crack_speed_threshold: float = 30.0
var prev_speed: float = 0.0

@export var jump_cooldown = 0.5
var time = 0.0

@export var jump_strenght = 500.0

var connected = false

func enter() -> void:
	if not connected:
		SignalBus.connect("trigger_persuer", _on_trigger_persuer)
		connected = true	
	egg_shape.disabled = false
	speed = initial_speed
	$"../..".max_speed = egg_max_speed
	$"../..".mass = egg_weight


	egg_sprite.play("egg")
	print("eggus maximus")
	SignalBus.stop_persuer.emit()

func exit() -> void:
	egg_shape.disabled = true

func update(delta: float) -> void:
	speed += delta * 50.0
	#if Input.is_action_just_pressed("evolve"):
	#	transitioned.emit(self, "chimken")
	
	time += delta

func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and character.on_floor and time > jump_cooldown:
		character.linear_velocity.y = -jump_strenght
		time = 0.0
	character.apply_force(Vector2(speed, 0.0))
	var current_speed: float = character.linear_velocity.length() 
	if prev_speed - current_speed > crack_speed_threshold:
		particle_emitter.emit_egg_shells()
		transitioned.emit(self, "cracking")
	prev_speed = current_speed
	
func _on_trigger_persuer():
	print("prrr")
	transitioned.emit(self, "PersuerEvent")
