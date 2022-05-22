extends AnimatedSprite
class_name Player

export(float) var max_heat: float = 4
export(float) var cooldown: float = 2

export(AudioStreamSample) var attack_sound
export(AudioStreamSample) var hurt_sound

signal attacked

var inputs = ["LeftAir", "LeftGround", "RightAir", "RightGround"]
var heat: float = 0
var stunned: bool = false

onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var sound_manager: SoundManager = $SoundManager

func _process(delta: float) -> void:
	for input in inputs:
		if Input.is_action_just_pressed(input):
			if stunned:
				break
			emit_signal("attacked", input, self)
			animation_player.play(input)
			sound_manager.play(attack_sound)
	if heat > 0:
		heat = max(0, heat - delta)
	if stunned and heat == 0:
		stunned = false
		modulate = Color.white

func damaged() -> void:
	sound_manager.play(hurt_sound)

func miss() -> void:
	heat += 1.5
	if heat >= max_heat:
		heat = cooldown
		stunned = true
		modulate = Color.black
