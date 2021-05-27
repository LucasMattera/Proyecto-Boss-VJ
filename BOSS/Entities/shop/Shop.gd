extends Node2D

var player 
onready var menu = $Menu
onready var value = 100
export (String) var shop_name = "shop"
var earnings = 10

func initialize(player):
	menu.set_shop_name(shop_name)
	self.player = player
	
func get_name():
	return self.shop_name
	
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		ShopState.add_shop(self)
		ShopState.current = self.shop_name				
		if(Player.has_shop(self)):
			get_tree().change_scene("res://ShopManageMenu.tscn")
		else:
			get_tree().change_scene("res://ShopMenuBuy.tscn")
