extends KinematicBody2D

export (int) var speed = 400
var velocity:Vector2 = Vector2.ZERO
var can_move = true
export (int) var zoomInLimit = 9
export (int) var zoomOutLimit = 1
export (int) var money = 2000
export (int) var last_earning = 0
export (String) var player_name = "Player"
var is_working = false
var shops = []
signal coin_picked
var objetives = {
	1: 'Ir a trabajar',
	2: 'Ir a bailar al club',
	3: 'Comprar la cafeteria',
	4: 'Salva las birras en el Argenchino',
	5: 'Adquirir todos los locales'
}
var actual = 1

func _ready():
	position.x = -4143.898
	position.y = -1187.306
	
func actual():
	return actual
	
func actual_objetive():
	return objetives[int(actual)]
	
func next_objetive():
	if(actual != 5):
		actual += 1

func buy(shop):
	var shop_to_add = {} 
	shop_to_add.shop_name = shop.shop_name
	shop_to_add.add_employee_value = shop.add_employee_value
	shop_to_add.upgrade_value = shop.upgrade_value
	shop_to_add.earnings = shop.earnings
	shop_to_add.value = shop.value
	shop_to_add.location = shop.location
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
	var find = shops.find(shop_to_add)
	if find > -1:
		shops[find].earnings = ShopState.earnings
		shops[find].add_employee_value = ShopState.add_employee_value

func upgrade_shop(shop_name):
	var shop_to_add = find_shop(shop_name)
	var find = shops.find(shop_to_add)
	if find > -1:
		shops[find].earnings = ShopState.earnings
		shops[find].upgrade_value = ShopState.upgrade_value

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
