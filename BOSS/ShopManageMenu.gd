extends Node2D

onready var shop_name = $ShopName
onready var background = $BGContainer/Background
signal confirmUpgrade
signal confirmHire
signal not_enough_cash

func _ready():
	shop_name.text = ShopState.shop_name
	var texture_path = str("res://assets/textures/shops/", ShopState.shop_name, ".png")
	background.set_texture(load(texture_path))

# Creditos: Icono hecho por freepik.com flaticon.com
func _on_Upgrade_pressed():
	if(player_have_enough_cash_upgrade()):
		emit_signal("confirmUpgrade")
	else:
		emit_signal("CannotBuyButton_pressed")
	

# Creditos: Icono hecho por freepik.com flaticon.com
func _on_Hire_pressed():
	if(player_have_enough_cash_hire()):
		emit_signal("confirmHire")
	else:
		emit_signal("CannotBuyButton_pressed")

func player_have_enough_cash_hire() -> bool:
	var earnings = Player.find_shop(ShopState.shop_name).earnings;
	return (ShopState.get_add_employee_value(earnings) <= Player.money)
	
func player_have_enough_cash_upgrade() -> bool:
	var earnings = Player.find_shop(ShopState.shop_name).earnings;
	return (ShopState.get_upgrade_value(earnings) <= Player.money)
	
	
func _on_ExitButton_pressed():
	get_tree().change_scene("res://Main.tscn")
