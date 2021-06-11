extends Node

var shop
var shop_name
var value
var earnings
var upgrade_value
var add_employee_value

func initialize(shop):
	self.shop = shop
	self.shop_name = shop.shop_name
	self.value = shop.value
	self.earnings = shop.earnings
	self.add_employee_value = shop.add_employee_value
	self.upgrade_value = shop.upgrade_value
	
func upgrade_shop():
	Player.upgrade_shop(self.shop_name)
	

func add_employee():
	Player.add_employee(self.shop_name)

func get_upgrade_value(earnings_shop):
	return int(round(earningWithNewUpgrade((earnings_shop)))) * 2
	
func get_add_employee_value(earnings_shop):
	return int(round(earningWithNewEmployee((earnings_shop)))) * 2

func earningWithNewUpgrade(earnings_shop):
	return int(round(earnings_shop + (earnings_shop / 8)))

func earningWithNewEmployee(earnings_shop):
	return int(round(earnings_shop + (earnings_shop / 10)))
