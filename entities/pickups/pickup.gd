class_name Pickup extends Area2D

var particles: PackedScene = preload("res://entities/pickups/pickup_particles.tscn")

func _on_body_entered(body: Node2D) -> void:
	SignalBus.pickup_picked.emit(self)
	var particle_scene = particles.instantiate()
	get_tree().root.get_child(0).add_child(particle_scene)
	particle_scene.global_position = global_position
	particle_scene.emitting = true
	queue_free()
