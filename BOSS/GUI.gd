extends Node

onready var Canvas_name = $Name
onready var Canvas_Money = $Money
onready var Canvas_Shop = $Shops


func _physics_process(delta):
	Canvas_name.set_text(Player.player_name)
	Canvas_Money.set_text("  " + String(Player.money))
	var shops_names = get_shop_names(Player.shops)
	Canvas_Shop.set_text("Shops:" + String(shops_names))
func initialize():
	Canvas_name.set_text(Player.player_name)
	Canvas_Money.set_text("$ " + String(Player.money))
	Canvas_Shop.set_text("Shops:" + String(Player.shops))
	
func get_shop_names(shops):
	var shops_names = []
	for shop in shops:
		shops_names.append(shop.shop_name)
	return shops_names
