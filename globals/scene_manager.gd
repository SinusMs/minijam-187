extends Node

const level_path = "res://levels/"

func _ready() -> void:
	#start with level0
	get_tree().change_scene_to_file("res://levels/start_level.tscn")
	SignalBus.start_game.connect(on_start_game)
	#SignalBus.finish_game.connect(on_game_finished)
	#SignalBus.finish_game.connect(on_game_restarted)
	

	
func on_start_game() -> void:
	for node in $current_scene.get_children():
		node.queue_free()
	get_tree().change_scene_to_file("res://levels/level2_hans.tscn")
	
func _on_game_finished() -> void:
	pass
	
func _on_game_restarted() -> void:
	pass
