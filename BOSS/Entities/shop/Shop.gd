extends Node2D

var player 
onready var menu = $Menu
onready var exit = $Exit
export (int) var value = 1000
export (String) var shop_name = "shop"
export (int) var earnings = 10
export (int) var upgrade_value = 10
export (int) var add_employee_value = 10
signal player_entered_on_shop

func initialize(player):
	menu.set_shop_name(shop_name)
	self.player = player

func get_name():
	return self.shop_name
	
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("player_entered_on_shop")
		if(Player.has_shop(self.shop_name)):
			ShopState.initialize(self)	
			get_tree().change_scene("res://ShopManageMenu.tscn")
		else:
			ShopState.initialize(self)	
			get_tree().change_scene("res://ShopMenuBuy.tscn")
	Player.can_move = false
	Player.position.y = exit.position.y + 100
	Player.position.x = exit.position.x 
	GameServer.save_game()
