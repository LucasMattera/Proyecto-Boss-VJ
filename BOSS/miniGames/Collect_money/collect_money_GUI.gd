extends Node

onready var Canvas_name = $Name
onready var Canvas_Money = $Money
onready var Canvas_Shop = $Shops
onready var earning_money = $EarningMoney
onready var lose_money = $LoseMoney
var last_Earning = 0
var player
var timerEarn
var counter_earn = 10

func recollect_money_player():
	self.counter_earn = self.counter_earn -1
	print(self.counter_earn)
	if(self.counter_earn == 0):
		self.player.recollect_money()
		self.counter_earn = 10
		
func _physics_process(delta):
	var timer = Timer.new()
	timer.set_wait_time(2)
	timer.set_one_shot(false)
	timer.connect("timeout", earning_money, "hide")
	timer.connect("timeout", lose_money, "hide")
	add_child(timer)
	if(last_Earning != 0):
		if(last_Earning > 0):
			earning_money.set_text("+$: " + String(last_Earning))
			earning_money.show()
			timer.start()
		else:
			lose_money.set_text("+$: " + String(last_Earning))
			lose_money.show()
			timer.start()
		last_Earning = 0		
	Canvas_name.set_text(Player.player_name)
	Canvas_Money.set_text("  " + String(Player.money))
	var shops_names = get_shop_names(Player.shops)
	Canvas_Shop.set_text("Locales:" + String(shops_names))
	
func initialize(player):
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
