extends Node

const level_path = "res://levels/"

func _ready() -> void:
	#start with level0
	get_tree().change_scene_to_file("res://globals/scene_manager.tscn")
	add_child(load("res://levels/start_level.tscn").instantiate())
	SignalBus.start_game.connect(on_start_game)
	SignalBus.unalived.connect(on_unalived)
	#SignalBus.finish_game.connect(on_game_finished)
	#SignalBus.finish_game.connect(on_game_restarted)
	

	
func on_start_game() -> void:
	for node in get_children():
		node.queue_free()
	add_child(load("res://levels/level2_hans.tscn").instantiate())
	print("start game")
	
func _on_game_finished() -> void:
	pass
	
func _on_game_restarted() -> void:
	pass

func on_unalived():
	pass
