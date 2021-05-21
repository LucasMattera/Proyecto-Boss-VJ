extends Node

onready var Canvas_name = $Name
onready var Canvas_Money = $Money

func _physics_process(delta):
	Canvas_name.set_text(Player.player_name)
	Canvas_Money.set_text("$ " + String(Player.money))

func initialize():
	Canvas_name.set_text(Player.player_name)
	Canvas_Money.set_text("$ " + String(Player.money))
	
