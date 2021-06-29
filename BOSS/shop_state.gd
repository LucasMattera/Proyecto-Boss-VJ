extends Node

var shop
var shop_name
var value
var earnings # $100
var upgrade_value # valor inicial $112
var add_employee_value # 110
var location

func initialize(shop):
	self.shop = shop
	self.shop_name = shop.shop_name
	self.value = shop.value
	self.earnings = shop.earnings
	self.add_employee_value = get_add_employee_value()
	self.upgrade_value = get_upgrade_value()
	self.location = shop.location

func upgrade_shop():
	Player.discount_money(upgrade_value)
	earnings = ShopState.earningWithNewUpgrade()
	upgrade_value = ShopState.get_upgrade_value()
	Player.upgrade_shop(self.shop_name)

func add_employee():
	Player.discount_money(add_employee_value)
	earnings = ShopState.earningWithNewUpgrade()
	upgrade_value = ShopState.get_add_employee_value()
	Player.add_employee(self.shop_name)

func get_upgrade_value():
	return int(round(earningWithNewUpgrade())) * 2

func get_add_employee_value():
	return int(round(earningWithNewEmployee())) * 2

func earningWithNewUpgrade():
	return int(round(earnings + (earnings / 8)))

func earningWithNewEmployee():
	var res = int(round(earnings + (earnings / 10)))
	return res

func update():
	var shop = Player.find_shop(shop_name)
	initialize(shop)
