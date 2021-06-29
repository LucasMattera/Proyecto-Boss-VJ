extends KinematicBody2D

export (int) var speed = 400
var velocity:Vector2 = Vector2.ZERO
var can_move = true
export (int) var zoomInLimit = 9
export (int) var zoomOutLimit = 1
export (int) var money = 150000
export (int) var last_earning = 0
export (String) var player_name = "Player"
var is_working = false
var shops = []
signal coin_picked

func _ready():
	position.x = -4143.898
	position.y = -1187.306

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
		ShopsInfo.update_shops(shop)
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
	var find = shops.find(shop_to_add)
	if find > -1:
		shops[find].earnings = ShopState.earnings
		shops[find].add_employee_value = ShopState.add_employee_value
		ShopsInfo.update_shops(shops[find])

func upgrade_shop(shop_name):
	var shop_to_add = find_shop(shop_name)
	var find = shops.find(shop_to_add)
	if find > -1:
		shops[find].earnings = ShopState.earnings
		shops[find].upgrade_value = ShopState.upgrade_value
		ShopsInfo.update_shops(shops[find])

func has_shop(shop_name):
	var has_shop = false
	for shop in Player.shops:
		if shop.shop_name == shop_name:
			has_shop = true
	return has_shop

func discount_money(amount: int):
	money -= amount

func obtain_money(amount: int, reason: String):
	print("Jugador obtuvo: $", amount, " en ", reason)
	last_earning = amount
	money += amount
