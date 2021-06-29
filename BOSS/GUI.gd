extends Node

onready var Canvas_name = $Info/Name
onready var Canvas_Money = $Info/Money
onready var earning_money = $Info/EarningMoney
onready var lose_money = $Info/LoseMoney
onready var timer_earning = $Info/TimerToEarning
var player
var timerEarn
var counter_earn = 10

func _ready():
	timer_earning.hide()

func recollect_money_player():
	self.counter_earn = self.counter_earn -1
	print(self.counter_earn)
	if(self.counter_earn == 0):
		self.player.recollect_money()
		self.counter_earn = 10
		
func _physics_process(delta):
	_handle_earnings_and_loses()
	_handle_money()
	Canvas_name.set_text(Player.player_name)
	Canvas_Money.set_text("  " + String(Player.money))
	var shops_names = get_shop_names(Player.shops)
	
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
	
func get_shop_names(shops):
	var shops_names = []
	for shop in shops:
		shops_names.append(shop.shop_name)
	return shops_names

func _handle_money():
	if(Player.money < 0):
		#Canvas_Money.add_color_override("font_color_shadow", Color(1,0,0))
		Canvas_Money.add_color_override("font_color", Color(1,0,0))
	if(Player.money >= 0):
		Canvas_Money.add_color_override("font_color", Color(0,0,0))
	if(Player.money < -1000):
		get_tree().change_scene("res://Lose.tscn")
		
func _handle_earnings_and_loses():
	if Player.shops.size() > 0:
		timer_earning.show()
	timer_earning.set_text("Proximas ganancias de locales en: "+ String(self.counter_earn) +" segundos")
	var timer = Timer.new()
	timer.set_wait_time(3)
	timer.set_one_shot(false)
	timer.connect("timeout", earning_money, "hide")
	add_child(timer)
	var timer_lose_money = Timer.new()
	timer_lose_money.set_wait_time(4)
	timer_lose_money.set_one_shot(false)
	timer_lose_money.connect("timeout", lose_money, "hide")
	add_child(timer_lose_money)
	if(Player.last_earning != 0):
		if(Player.last_earning > 0):
			earning_money.set_text("+$: " + String(Player.last_earning))
			earning_money.show()
			timer.start()
		else:
			lose_money.set_text("+$: " + String(Player.last_earning))
			lose_money.show()
			timer_lose_money.start()
		Player.last_earning = 0

func _on_PauseMenu_exit():
	$NowLoading.visible = true

func _on_Player_open_shop_status():
	$ShopsInfoTable.show_hide_table()
