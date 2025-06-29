extends Label
class_name Stopwatch

var time = 0.0
var stopped = false

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	SignalBus.level_started.connect(reset)
	

func _process(delta: float) -> void:
	if stopped:
		return
	time += delta
	Utils.time = time
	text = time_to_string()
	
func reset() -> void:
	time = 0.0
	
func pause() -> void:
	stopped = true
	
func resume() -> void:
	stopped = false
	
func get_time() -> float:
	return time
	
func time_to_string() -> String:
	# format time as cool string (00 : 00 : 00)
	var msec = fmod(time, 1) * 1000
	var sec = fmod(time, 60)
	var min = time / 60
	var format_string = "%02d : %02d : %02d"
	var actual_string = format_string % [min, sec, msec]
	return actual_string
