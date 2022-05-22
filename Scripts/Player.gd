extends AnimatedSprite
class_name Player

export(float) var max_heat: float = 4
export(float) var cooldown: float = 2

signal attacked

var inputs = ["LeftAir", "LeftGround", "RightAir", "RightGround"]
var heat: float = 0
var stunned: bool = false

func _process(delta: float) -> void:
	for input in inputs:
		if Input.is_action_just_pressed(input):
			if stunned:
				print("Stunned!")
				break
			emit_signal("attacked", input, self)
			flip_h = "Right" in input
	if heat > 0:
		heat = max(0, heat - delta)
	if stunned and heat == 0:
		stunned = false
		modulate = Color.white

func miss() -> void:
	heat += 1.5
	if heat >= max_heat:
		print("Overheat!")
		heat = cooldown
		stunned = true
		modulate = Color.black
