extends Node2D

@onready var line_edit: LineEdit = $LineEdit
@onready var label: Label = $Label

func _ready():
	visible = false
	line_edit.text_submitted.connect(_on_LineEdit_text_entered)
	process_mode = Node.PROCESS_MODE_ALWAYS 
	
func _on_LineEdit_text_entered(new_text: String) -> void:
	SignalBus.name_entered.emit(new_text)
	visible = false
	Utils.player_name = new_text
	print(new_text)
