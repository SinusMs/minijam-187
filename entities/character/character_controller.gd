extends RigidBody2D

var on_floor_currently: bool = false
var on_floor: bool = false


var start_coord_x: int;
var end_coord_x: int;

@export var move_speed: float = 500.0

@export var floor_margin: float = 0.3
var time = 0.0

@export var initial_shit_amount: int = 3
var shit_amount: int
@export var can_shit: bool = false

func  _ready() -> void:
	shit_amount = initial_shit_amount
	SignalBus.pickup_picked.connect(_on_pickup)
	for child in get_parent().get_children():
		if child.name == "LevelEnd":
			end_coord_x = child.position.x
			print("END")
		if child.name == "LevelStart":
			start_coord_x = child.position.x
			print("START")

			
			
func _process(delta: float) -> void:
	updateProgressbar();
			
func updateProgressbar() -> void:
	var current_position_x = position.x;
	var first: int = current_position_x - start_coord_x;
	var second: int = end_coord_x - start_coord_x;
	SignalBus.MoveProgressBar.emit(1.0 * first / second);

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	on_floor_currently = false
	
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

func _on_pickup(type: Pickup) -> void:
	if type is NougatBits:
		shit_amount -= 1
		if shit_amount <= 0:
			can_shit = true
