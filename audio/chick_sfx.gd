extends AudioStreamPlayer2D

@export var farm_mode: bool = false 

@export var frequency: float = 1

func _ready() -> void:
	$Timer.wait_time = frequency/1
	if farm_mode:
		$Timer.start()
	

func _on_timer_timeout() -> void:
	playing = true
	$Timer.start()
