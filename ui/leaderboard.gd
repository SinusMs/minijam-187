extends Control

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS 

func fill_grid() -> void:
	$ColorRect/LeaderboardGrid.fill_grid()
