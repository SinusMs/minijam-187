extends Panel

@export var text: String

func _ready() -> void:
	$Label.text = text

func _process(_delta: float) -> void:
	$Label.text = text

func set_text(new_text: String) -> void:
	text = new_text
