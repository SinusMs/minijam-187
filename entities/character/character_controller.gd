extends RigidBody2D

var on_floor_currently: bool = false
var on_floor: bool = false
@export var floor_margin: float = 0.3
var time = 0.0

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	on_floor_currently = false # reset on_floor for this physics frame
	
	var i := 0
	while i < state.get_contact_count():
		var normal := state.get_contact_local_normal(i)
		var this_contact_on_floor = normal.dot(Vector2.UP) > 0.99
		
		on_floor_currently = on_floor_currently or this_contact_on_floor
		i += 1

func _physics_process(delta: float) -> void:
	on_floor = time < floor_margin
	if on_floor_currently:
		time = 0.0
	else:
		time += delta
