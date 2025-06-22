extends Node

const level_path = "res://levels/"

var mini_level: Array = [preload("res://levels/chimken_mini_level1.tscn").instantiate(),
		preload("res://levels/chimken_mini_level2.tscn").instantiate(),
		preload("res://levels/chimken_mini_level3.tscn").instantiate()]

func _ready() -> void:
	#start with level0
	#get_tree().change_scene_to_file("res://globals/scene_manager.tscn")
	add_child(load("res://levels/start_level.tscn").instantiate())
	SignalBus.start_game.connect(on_start_game)
	SignalBus.egg_broke.connect(on_egg_broke)
	SignalBus.finish_game.connect(on_game_finished)
	SignalBus.restart_game.connect(on_game_restarted)
	SignalBus.unalived.connect(on_unalived)

func on_start_game() -> void:
	for node in get_children():
		node.queue_free()
	call_deferred("add_child", load("res://levels/level_part_ferdi.tscn").instantiate())
	print("start game")

func on_game_finished() -> void:
	for node in get_children():
		node.queue_free()
	call_deferred("add_child", load("res://levels/end_level.tscn").instantiate())
	print("end screen")

func on_egg_broke(pos: Vector2) -> void:
	var rand_mini_level = mini_level[randi_range(0, 2)]
	add_child(rand_mini_level)
	rand_mini_level.global_position = pos
	if rand_mini_level.has_method("reset"):
		print("broke")
		rand_mini_level.reset()
	
func on_game_restarted() -> void:
	for node in get_children():
		node.queue_free()
	print("restart")
	call_deferred("add_child", load("res://levels/start_level.tscn").instantiate())

func on_unalived():
	
	pass
