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
	earnings += earnings % 2
	Player.add_employee(self.shop_name)


