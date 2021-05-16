extends Node

onready var Canvas_name = $Name
onready var Canvas_Money = $Money
var player

func initialize(player):
	self.player = player
	Canvas_name.set_text(player.player_name)
	Canvas_Money.set_text("$ " + String(player.money))

func _on_Player_player_stats_changed(player):
	Canvas_name.set_text(player.player_name)
	Canvas_Money.set_text("$ " + String(player.money))
