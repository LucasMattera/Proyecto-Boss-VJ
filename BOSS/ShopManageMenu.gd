extends Node2D

onready var shop_name = $ShopName
#onready var value = $GUI/ValueRect/Value
onready var background = $BGContainer/Background
signal confirm
signal not_enough_cash
signal purchased

func _ready():
	shop_name.text = ShopState.shop_name
	#value.text = str(ShopState.value)
	var texture_path = str("res://assets/textures/shops/", ShopState.shop_name, ".png")
	background.set_texture(load(texture_path))
	#if player_have_enough_cash():
		#$GUI/ValueRect.color = Color(0, 1.0, 0, 0.5)
	#else:
		#$GUI/ValueRect.color = Color(1.0, 0, 0, 0.5)

func _on_Exit_pressed():
	get_tree().change_scene("res://Main.tscn")

# Creditos: Icono hecho por freepik.com flaticon.com
func _on_Upgrade_pressed():
	ShopState.upgrade_shop()
	get_tree().change_scene("res://Main.tscn")

func player_have_enough_cash(amount) -> bool:
	return Player.money > amount

# Creditos: Icono hecho por freepik.com flaticon.com
func _on_Hire_pressed():
	ShopState.add_employee()
	get_tree().change_scene("res://Main.tscn")
