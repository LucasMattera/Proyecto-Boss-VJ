extends Node

onready var Canvas_name = $Name
onready var Canvas_Money = $Money
onready var Canvas_Shop = $Shops


func _physics_process(delta):
	Canvas_name.set_text(Player.player_name)
	Canvas_Money.set_text("$ " + String(Player.money))
	Canvas_Shop.set_text("Shops:" + String(Player.shops))
func initialize():
	Canvas_name.set_text(Player.player_name)
	Canvas_Money.set_text("$ " + String(Player.money))
	Canvas_Shop.set_text("Shops:" + String(Player.shops))
	
