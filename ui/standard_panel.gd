extends Panel

@export var text: String

func _ready() -> void:
	$Label.text = text
