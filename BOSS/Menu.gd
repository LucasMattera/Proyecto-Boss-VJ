extends Control

var player : KinematicBody2D
var shop_name 

func initialize(player):
	self.player = player

func _ready():
	pass
	
func set_shop_name(name):
	shop_name = name
	
func set_player():
	var vector = Vector2(Player.position.x , Player.position.y )
	self.set_global_position(vector)
	
func _on_Buy_pressed():
	player.buy(shop_name)
	self.hide()


func _on_Exit_pressed():
	self.hide()
