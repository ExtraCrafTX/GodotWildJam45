extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/PlayBtn.grab_focus()

func _on_PlayBtn_pressed() -> void:
	get_tree().change_scene("res://Levels/Level0.tscn")

func _on_QuitBtn_pressed() -> void:
	get_tree().quit()
