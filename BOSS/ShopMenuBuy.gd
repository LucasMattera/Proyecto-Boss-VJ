extends Node2D

onready var label = $Label

func _ready():
	label.text = ShopState.shop_name
	
func _on_Buy_pressed():
	Player.buy(ShopState)
	get_tree().change_scene("res://Main.tscn")


func _on_Exit_pressed():
	get_tree().change_scene("res://Main.tscn")
