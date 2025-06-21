extends Node


var leaderboard: Array = [["Peter", 3.0], ["Paul", 24.4], ["Clara", 0.5]]

# adds playthrough to leadboard and sorts instantly in ascending order
func add_to_leaderboard(name: String, time: float):
	leaderboard.append([name, time])
	leaderboard.sort_custom(func(a, b): return a[1] < b[1])

func sort_leaderboard() -> void:
	leaderboard.sort_custom(func(a, b): return a[1] < b[1])
