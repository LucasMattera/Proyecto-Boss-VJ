extends Control

var sn = 0
var row = load("res://scenes/gui/incomes/ShopsInfoRow.tscn")
onready var tablePath = "Table/Rows/ScrollContainer/VBoxContainer/"

func _ready():
	add_all_shops_purchased()

func add_all_shops_purchased():
	for shop in Player.shops:
		add_shop(shop)

func show_hide_table():
	visible = !visible

func add_shop(shopRow: Dictionary):
	var instance = add_row(shopRow)
	insert_data_of_shop_on_row(shopRow, instance)

func add_row(shopRow: Dictionary):
	sn += 1
	var instance = row.instance()
	instance.name = str(sn)
	var table = $Table/Rows/ScrollContainer/VBoxContainer
	table.add_child(instance)
	return instance

func insert_data_of_shop_on_row(shopRow: Dictionary, instance):
	# Changing data of a row
	get_node(str(tablePath, instance.name, "/name")).text = shopRow.shop_name
	get_node(str(tablePath, instance.name, "/earnings")).text = str(shopRow.earnings)
	get_node(str(tablePath, instance.name, "/addEmployeeCost")).text = str("-$", get_add_employee_value(shopRow))
	get_node(str(tablePath, instance.name, "/improveStructureCost")).text = str("-$", get_upgrade_value(shopRow))
	get_node(str(tablePath, instance.name, "/location")).text = shopRow.location

func get_add_employee_value(shop: Dictionary):
	var res = int(round(shop.earnings + (shop.earnings / 10)))
	return int(round(res)) * 2

func get_upgrade_value(shopRow: Dictionary):
	var res = int(round(shopRow.earnings + (shopRow.earnings / 8)))
	return int(round(res)) * 2
