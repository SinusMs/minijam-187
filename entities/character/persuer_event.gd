extends State

@export var character: RigidBody2D
@export var sprite: AnimatedSprite2D

var prev_velocity
var prev_angular_vel
var gravity
var prev_state


# Called when the node enters the scene tree for the first time.
func enter():
	gravity = character.gravity_scale
	character.gravity_scale = 0
	prev_velocity = character.linear_velocity
	character.linear_velocity = Vector2(0.0, 0.0)
	prev_angular_vel = character.angular_velocity
	character.angular_velocity = 0.0
	
	SignalBus.unalived.connect(_on_unalived)
	SignalBus.connect("survived_persuer", _on_survived_persuer)
	
func _on_survived_persuer():
	character.gravity_scale = gravity
	character. angular_velocity = prev_angular_vel
	character.linear_velocity = prev_velocity
	print("persuer survived")
	transitioned.emit(self, "chimken")

func _on_unalived():
	sprite.play("shit")
	#restart
	pass
