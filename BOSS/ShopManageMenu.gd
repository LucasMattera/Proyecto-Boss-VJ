extends Node2D

onready var shop_name = $ShopName
onready var background = $BGContainer/Background
signal confirmUpgrade
signal confirmHire

func _ready():
	shop_name.text = ShopState.shop_name
	var texture_path = str("res://assets/textures/shops/", ShopState.shop_name, ".png")
	background.set_texture(load(texture_path))

# Creditos: Icono hecho por freepik.com flaticon.com
func _on_Upgrade_pressed():
	emit_signal("confirmUpgrade")
	

# Creditos: Icono hecho por freepik.com flaticon.com
func _on_Hire_pressed():
	emit_signal("confirmHire")

func _on_ExitButton_pressed():
	get_tree().change_scene("res://Main.tscn")
