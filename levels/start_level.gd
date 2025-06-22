extends Node2D


func _on_start_game_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		SignalBus.start_game.emit()
		print("start_body_entered")
