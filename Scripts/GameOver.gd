extends CenterContainer



func _on_Retry_pressed():
	GameController.playerHP = GameController.playerDefHP
	get_tree().change_scene("res://Levels/Level0.tscn")
	


func _on_Exit_pressed():
	get_tree().change_scene("res://Main.tscn")
