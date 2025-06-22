extends Node2D


func _on_finish_area_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		SignalBus.finish_game.emit()
		print("entered finish area in level")
	
