extends State
class_name Egg

func enter() -> void:
	transitioned.emit(self, "chimken")

func exit() -> void:
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass
