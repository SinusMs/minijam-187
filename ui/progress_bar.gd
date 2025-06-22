extends Control

## x-coordinate of progress bar start in panel-space
var progress_start: int; 

## x-coordinate of progress bar end in panel-space
var progress_end: int; 

## progress bar's progress ranging from 0 to 1
var progress_current: float; 

var time_total: float = 0.0; # testing var

## persuer moves only when chicken
var move_persuer: bool = false

## how long the persuer needs to reach the chicken
var persuer_speed: float = 20.0

## time the persuer has been chasing since last time
var persuer_dtime: float = 0.0

func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE
	$Panel/persuer.position.x = progress_start
	$Panel/persuer.position.y = $Panel/ProgressIcon/AnimatedUiSprite.position.y
	# Setup progress bar start and end
	progress_start = $Panel/ProgressIcon.position.x;
	progress_end = progress_start + $Panel.size.x - $Panel/ProgressIcon.size.x;
	SignalBus.MoveProgressBar.connect(move_chicken_icon);
	SignalBus.move_persuer.connect(_on_move_persuer)
	SignalBus.stop_persuer.connect(_on_stop_persuer)
	SignalBus.reset_persuer.connect(_on_reset_persuer)
	$Panel/ProgressIcon/AnimatedUiSprite.animation

func _process(delta):
	if(persuer_speed <= persuer_dtime):
		SignalBus.trigger_persuer.emit()
		move_persuer = false
		persuer_dtime = 0.0
	# Debugging
	if Input.is_key_pressed(KEY_R):
		time_total = 0;
		

		
	# time based Testing
	if move_persuer:
		persuer_dtime += delta


## Moves the UI Progress Icon to [param progress]% [br]
## Sets [member progress_current] to [param progress]
func move_chicken_icon(progress: float) -> void:
	progress_current = progress;

	$Panel/ProgressIcon.position.x = lerp(progress_start, progress_end, clampf(progress, 0, 1));

	
	
	if move_persuer:
		var temp = lerp(progress_start*1.0, progress, 1 - (persuer_speed - persuer_dtime)/ persuer_speed)
		$Panel/persuer.position.x = lerp(progress_start, progress_end, clampf(temp, 0, 1))

	pass


func _on_move_persuer():
	print("the persuer wants your ass")
	move_persuer = true

func _on_reset_persuer():
	$Panel/persuer.position.x = progress_start
	persuer_dtime = 0.0

func _on_stop_persuer():
	print("persuer stopps")
	move_persuer = false
