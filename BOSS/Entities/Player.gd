extends KinematicBody2D

export (int) var speed = 400
var velocity:Vector2 = Vector2.ZERO
var can_move = true
export (int) var zoomInLimit = 9
export (int) var zoomOutLimit = 1
export (int) var money = 500
export (int) var last_earning = 0
export (String) var player_name = "Player"
var shops = []

func buy(shop):
	var shop_to_add = {} 
	shop_to_add.shop_name = shop.shop_name
	shop_to_add.add_employee_value = shop.add_employee_value
	shop_to_add.upgrade_value = shop.upgrade_value
	shop_to_add.earnings = shop.earnings
	shop_to_add.value = shop.value
	var shop_name = shop_to_add.shop_name
	var shop_value = shop_to_add.value
	if (!Player.has_shop(shop_name) && Player.money >= shop_value):
		Player.shops.append(shop_to_add)
		Player.money -= shop_value
		print("compraste ")
		if (self.shops.size() == GameServer.shops_size):
			get_tree().change_scene("res://Win.tscn")
	else: 
		print("no compraste")
		
func find_shop(shop_name):
	var shop_to_return
	print("shops :", shops)
	for shop in Player.shops:
		if shop.shop_name == shop_name:
			shop_to_return = shop
	return shop_to_return
	
func get_earnings_from(shop_name):
	var shop_to_return_earnings = find_shop(shop_name)
	return shop_to_return_earnings.earnings
		
func add_employee(shop_name):
	var shop_to_add = find_shop(shop_name)
	print("shop name :" , shop_name)
	shop_to_add.earnings = ShopState.earningWithNewEmployee(shop_to_add.earnings)
	shop_to_add.add_employee_value = ShopState.earningWithNewEmployee(shop_to_add.earnings) * 2

func upgrade_shop(shop_name):
	var shop_to_add = find_shop(shop_name)
	print("shop name :" , shop_name)
	shop_to_add.earnings = ShopState.earningWithNewUpgrade(shop_to_add.earnings)
	shop_to_add.upgrade_value = ShopState.earningWithNewUpgrade(shop_to_add.earnings) * 2

func has_shop(shop_name):
	var has_shop = false
	for shop in Player.shops:
		if shop.shop_name == shop_name:
			has_shop = true
	return has_shop
