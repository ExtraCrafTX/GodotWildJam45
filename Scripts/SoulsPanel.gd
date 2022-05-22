extends NinePatchRect

onready var souls_label = $SoulsLabel

func _ready() -> void:
	souls_updated(GameController.souls)
	GameController.connect("souls_updated", self, "souls_updated")

func souls_updated(souls: int) -> void:
	souls_label.text = str(souls)
	souls_label.margin_left = souls_label.margin_right - 4 * souls_label.text.length()
