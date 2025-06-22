extends Node2D

func _ready() -> void:
	SignalBus.name_entered.connect(on_name_entered)

func _on_death_area_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		## play shredder audio and pause shortly
		body.free()
		$EnterName.visible = true

func on_name_entered() -> void:
	$Leaderboard.visible = true
