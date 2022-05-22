extends Popup

export(NodePath) var level_path
onready var level = get_node(level_path)



func _input(event):
	if event.is_action_pressed("Pause"):
		level.togglePauseGame()
