extends CanvasLayer

var paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS 

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		paused = not paused
		visible = paused
		get_tree().paused = paused

func _on_return_button_pressed() -> void:
	visible = false
	get_tree().paused = false

func _on_exit_button_pressed() -> void:
	get_tree().quit()
