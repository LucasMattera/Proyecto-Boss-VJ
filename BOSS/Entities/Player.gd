extends KinematicBody2D

export (int) var speed = 400
var velocity:Vector2 = Vector2.ZERO
var can_move = true
export (int) var zoomInLimit = 9
export (int) var zoomOutLimit = 1
export (int) var money = 500
export (String) var player_name = "Player"
var shops = []

func buy(shop):
	var shop_name = shop.shop_name
	var shop_value = shop.value
	if (!Player.shops.has(shop) && Player.money >= shop_value):
		Player.shops.append(shop)
		Player.money -= shop_value
		print("compraste ")
	else: 
		print("no compraste")
		
func add_employee(shop_name):
	pass
	
func upgrade_shop(shop_name):
	pass

func has_shop(shop):
	var has_shop = false
	for shop in self.shops:
		if shop.shop_name == shop.shop_name:
			has_shop = true
	return has_shop
