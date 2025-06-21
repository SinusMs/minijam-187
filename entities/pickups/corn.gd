class_name Corn extends Pickup

#### COMMENTED OUT RANDOM SPRITE FROM SPRITESHEET PICKING
#var frames

func _ready() -> void:
	pass
	#frames = $Sprite2D.texture.get_width() / $Sprite2D.region_rect.size.x
	#var random_index = randi_range(0, frames - 1)
	#if must_be_pineapple:
	#	random_index = 2
	#$Sprite2D.region_rect.position.x = random_index * $Sprite2D.region_rect.size.x

	
func _process(_delta: float) -> void:
	pass
