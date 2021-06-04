extends Node2D

onready var shop_name = $ShopName
onready var value = $GUI/ValueRect/Value
onready var background = $BGContainer/Background
signal confirm
signal not_enough_cash
signal purchased

func _ready():
	shop_name.text = ShopState.shop_name
	value.text = str(ShopState.value)
	var texture_path = str("res://assets/textures/shops/", ShopState.shop_name, ".png")
	background.set_texture(load(texture_path))
	if player_have_enough_cash():
		$GUI/ValueRect.color = Color(0, 1.0, 0, 0.5)
	else:
		$GUI/ValueRect.color = Color(1.0, 0, 0, 0.5)

func _on_BuyButton_pressed():
	if player_have_enough_cash():
		emit_signal("confirm")
	else:
		emit_signal("not_enough_cash")

func player_have_enough_cash() -> bool:
	return (ShopState.value <= Player.money)

func _on_ExitButton_pressed():
	get_tree().change_scene("res://Main.tscn")

func _on_Confirm_purchased():
	Player.buy(ShopState)
	emit_signal("purchased")
