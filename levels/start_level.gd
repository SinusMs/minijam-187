extends Node2D


func _on_start_game_body_entered(body: Node2D) -> void:
	SignalBus.start_game.emit()
