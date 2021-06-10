extends Node

var shop
var shop_name
var value
var earnings

func initialize(shop):
	self.shop = shop
	self.shop_name = shop.shop_name
	self.value = shop.value
	self.earnings = shop.earnings

func upgrade_shop():
	Player.upgrade_shop(self.shop_name)
	

func add_employee():
	Player.add_employee(self.shop_name)

func earningWithNewUpgrade(earnings_shop):
	return int(round(earnings_shop + (earnings_shop / 8)))

func earningWithNewEmployee(earnings_shop):
	return int(round(earnings_shop + (earnings_shop / 10)))
