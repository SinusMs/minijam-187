extends Node2D

@export var leaderboard: Control

func _ready() -> void:
	SignalBus.name_entered.connect(on_name_entered)

func _on_death_area_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		## play shredder audio and pause shortly
		$Shredder_SFX.play()
		body.free()
		$EnterName.visible = true

func on_name_entered(name: String) -> void:
	print("name_entered")
	leaderboard.visible = true
	leaderboard.fill_grid()
	$RestartButton.visible = true


func _on_restart_button_pressed() -> void:
	print("restart?")
	SignalBus.restart_game.emit()
