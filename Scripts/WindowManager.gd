extends Node

func _ready() -> void:
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	window_size = window_size * 6
	OS.set_window_size(window_size)
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
