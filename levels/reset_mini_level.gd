extends Node2D

var pickup_locations: Array = []
var pickup: PackedScene = preload("res://entities/pickups/nougat_bits.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in $pickups.get_children():
		pickup_locations.append(child.position)

func reset() -> void:
	for location in pickup_locations:
		var pickup_scene: Area2D = pickup.instantiate()
		$pickups.add_child(pickup_scene)
		pickup_scene.global_position = global_position + location
