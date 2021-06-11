extends Node

onready var Canvas_name = $Name
onready var Canvas_Money = $Money
onready var Canvas_Shop = $Shops
onready var earning_money = $EarningMoney
onready var lose_money = $LoseMoney
onready var timer_earning = $TimerToEarning
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
	timer_earning.set_text("Proximas ganancias de locales en: "+ String(self.counter_earn) +" segundos")
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
	
func initialize(player):
	timerEarn = Timer.new()
	self.timerEarn.set_wait_time(1)
	self.timerEarn.set_one_shot(false)
	self.timerEarn.connect("timeout", self, "recollect_money_player")
	add_child(timerEarn)
	self.timerEarn.start()
	self.player = player
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
