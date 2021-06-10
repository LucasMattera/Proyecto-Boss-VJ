extends Node

onready var Canvas_name = $Name
onready var Canvas_Money = $Money
onready var Canvas_Shop = $Shops
onready var earning_money = $EarningMoney
onready var lose_money = $LoseMoney

func _physics_process(delta):
	var timer = Timer.new()
	timer.set_wait_time(3)
	timer.set_one_shot(false)
	timer.connect("timeout", earning_money, "hide")
	timer.connect("timeout", lose_money, "hide")
	add_child(timer)
	
	if(Player.last_earning != 0):
		if(Player.last_earning > 0):
			earning_money.set_text("+$: " + String(Player.last_earning))
			earning_money.show()
			timer.start()
		else:
			lose_money.set_text("+$: " + String(Player.last_earning))
			lose_money.show()
			timer.start()
		Player.last_earning = 0		
	Canvas_name.set_text(Player.player_name)
	Canvas_Money.set_text("  " + String(Player.money))
	var shops_names = get_shop_names(Player.shops)
	Canvas_Shop.set_text("Locales:" + String(shops_names))
func initialize():
	earning_money.hide()
	lose_money.hide()
	Canvas_name.set_text(Player.player_name)
	Canvas_Money.set_text("$ " + String(Player.money))
	Canvas_Shop.set_text("Locales:" + String(Player.shops))
	
func get_shop_names(shops):
	var shops_names = []
	for shop in shops:
		shops_names.append(shop.shop_name)
	return shops_names
