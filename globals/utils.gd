extends Node


var leaderboard: Array = [["Peter", 3.0], ["Paul", 24.4], ["Clara", 0.5]]

var crt: bool = false 

var generation: int = 0

var total_pickups_eaten: int = 0
var current_pickups: int = 0
var needed_pickups: int = 0

var progress: float = 0.0

var time: float

var player_name: String


func _ready() -> void:
	SignalBus.name_entered.connect(on_name_entered)

# adds playthrough to leadboard and sorts instantly in ascending order
func add_to_leaderboard(name: String, time: float):
	leaderboard.append([name, time])
	sort_leaderboard()

func sort_leaderboard() -> void:
	leaderboard.sort_custom(func(a, b): return a[1] < b[1])

func on_name_entered(name: String) -> void:
	add_to_leaderboard(name, time)
