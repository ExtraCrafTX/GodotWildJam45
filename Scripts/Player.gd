extends AnimatedSprite

signal attacked

var inputs = ["LeftAir", "LeftGround", "RightAir", "RightGround"]

func _process(delta: float) -> void:
	for input in inputs:
		if Input.is_action_just_pressed(input):
			emit_signal("attacked", input)
			flip_h = "Right" in input
