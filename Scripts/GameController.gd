extends Node

signal souls_updated

var souls: int = 0 setget set_souls

func set_souls(new_souls: int) -> void:
	souls = new_souls
	emit_signal("souls_updated", souls)
