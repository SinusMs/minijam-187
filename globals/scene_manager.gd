extends Node

const level_path = "res://levels/"

var mini_level: Array = [preload("res://levels/chimken_mini_level1.tscn"),
		preload("res://levels/chimken_mini_level2.tscn"),
		preload("res://levels/chimken_mini_level3.tscn")]

func _ready() -> void:
	#start with level0
	$introtimer.start()
	#get_tree().change_scene_to_file("res://globals/scene_manager.tscn")
	add_child(load("res://ui/intro.tscn").instantiate())
	SignalBus.start_game.connect(on_start_game)
	SignalBus.egg_broke.connect(on_egg_broke)
	SignalBus.finish_game.connect(on_game_finished)
	SignalBus.restart_game.connect(on_game_restarted)

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
	var rand_mini_level_scene = rand_mini_level.instantiate()
	add_child(rand_mini_level_scene)
	rand_mini_level_scene.global_position = pos
	if rand_mini_level_scene.has_method("reset"):
		rand_mini_level_scene.reset()

func on_game_restarted() -> void:
	for node in get_children():
		node.queue_free()
	print("restart")
	call_deferred("add_child", load("res://levels/start_level.tscn").instantiate())

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("reset"):
		on_game_restarted()


func _on_introtimer_timeout() -> void:
	on_game_restarted()
