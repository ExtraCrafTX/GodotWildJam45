extends NinePatchRect

onready var souls_label = $SoulsLabel

func _ready() -> void:
	souls_label.text = str(GameController.souls)
	GameController.connect("souls_updated", self, "souls_updated")

func souls_updated(souls: int) -> void:
	souls_label.text = str(souls)
