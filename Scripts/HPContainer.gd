extends ItemList

onready var heartSprite = preload("res://Sprites/heart_tmp.png")
onready var items_amount = GameController.playerHP
onready var itmes_width = 6
onready var items_height = 6


func _ready():
	self.max_columns = GameController.playerHP
	self.fixed_icon_size = Vector2(6,6)
	self.icon_mode = self.ICON_MODE_TOP
	self.same_column_width = true
	
	for i in range(items_amount):
		self.add_item("",heartSprite,false)
	
		
	
	print(self.get_item_count())
	GameController.connect("heart_removed",self,"heart_removed")
	GameController.connect("heart_add",self,"heart_add")
	
	
	
func heart_removed(number:int) ->void:
	self.remove_item(0)

		

func heart_add() -> void:
	self.add_item("",heartSprite,false)

