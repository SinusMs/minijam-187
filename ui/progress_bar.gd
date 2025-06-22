extends Control

## x-coordinate of progress bar start in panel-space
var progress_start: int; 

## x-coordinate of progress bar end in panel-space
var progress_end: int; 

## progress bar's progress ranging from 0 to 1
var progress_current: float; 

var time_total: float = 0.0; # testing var

func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE
	# Setup progress bar start and end
	progress_start = $Panel/ProgressIcon.position.x;
	progress_end = progress_start + $Panel.size.x - $Panel/ProgressIcon.size.x;
	SignalBus.MoveProgressBar.connect(move_chicken_icon);
	$Panel/ProgressIcon/AnimatedUiSprite.animation

func _process(delta):
	# Debugging
	if Input.is_key_pressed(KEY_R):
		time_total = 0;
		
	# Testing
	time_total += delta;
	var progress: float = lerp(progress_start, progress_end, clampf(time_total / 10, 0, 1));
	move_chicken_icon(progress);

## Moves the UI Progress Icon to [param progress]% [br]
## Sets [member progress_current] to [param progress]
func move_chicken_icon(progress: float) -> void:
	progress_current = progress;
	$Panel/ProgressIcon.position.x = progress_current;
	pass
