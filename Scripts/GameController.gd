extends Node

signal souls_updated
signal heart_removed
signal heart_add #unused atm

var souls: int = 0 setget set_souls

func set_souls(new_souls: int) -> void:
	souls = new_souls
	emit_signal("souls_updated", souls)

var playerHP: int = 10

func damagePlayer() -> void:
	playerHP -=1
	emit_signal("heart_removed",1)
	print("Player HP:", playerHP)
	if playerHP <= 0:
		print("Player is ded")
