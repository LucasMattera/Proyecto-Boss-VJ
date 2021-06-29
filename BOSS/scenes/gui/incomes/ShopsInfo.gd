extends Control

var row = load("res://scenes/gui/incomes/ShopsInfoRow.tscn")
onready var tablePath = "Table/Rows/ScrollContainer/VBoxContainer/"
#onready var table: VBoxContainer
onready var rowNodes: Array = []
onready var shopsToUpdate: Array = []
var sn = 0
onready var listOfShops = []

func add_shop(shopRow):
	# Add row
	sn += 1
	var instance = row.instance()
	instance.name = str(sn)
	var table = $Table/Rows/ScrollContainer/VBoxContainer
	table.add_child(instance)
	
	# Changing data of a row
	get_node(str(tablePath, instance.name, "/name")).text = shopRow.shop_name
	get_node(str(tablePath, instance.name, "/earnings")).text = str(shopRow.earnings)
	get_node(str(tablePath, instance.name, "/addEmployeeCost")).text = str("-$", shopRow.add_employee_value)
	get_node(str(tablePath, instance.name, "/improveStructureCost")).text = str("-$", shopRow.upgrade_value)
	#get_node(str(tablePath, instance.name, "/location")).text = shopRow.location
	rowNodes.append(instance)

func update_table():
	update_list_of_shops()
#	for shopIndex in range(0, listOfShops.size()):
#		add_shop(listOfShops[shopIndex])

func update_shops(shop):
	if shopsToUpdate.has(shop):
		replace_shop(shop)
	else:
		var shop_to_add: Dictionary = shop_to_dictionary(shop)
		shopsToUpdate.append(shop_to_add)
		pass

func shop_to_dictionary(shop) -> Dictionary:
	return {
		"shop_name": shop.shop_name,
		"earnings": shop.earnings,
		"value": shop.value,
		"add_employee_value": shop.add_employee_value,
		"upgrade_value": shop.upgrade_value
		}

func replace_shop(aShop):
	for shop in shopsToUpdate:
		if shop.shop_name == aShop.shop_name:
			shopsToUpdate[shop] = aShop

func show_table():
	visible = !visible
	for shop in ShopsInfo.shopsToUpdate:
		add_shop(shop)
	ShopsInfo.shopsToUpdate = []

func update_list_of_shops():
	listOfShops = Player.shops
