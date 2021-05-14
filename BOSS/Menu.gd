extends Control

var player : KinematicBody2D

func initialize(player):
	self.player = player

func _ready():
	pass
	
func set_player(player):
	self.player = player
	print(player.get_camera_position())
	var vector = Vector2(player.get_camera_position().x - 500, player.get_camera_position().y -300)
	self.set_global_position(vector)
	
func _on_Buy_pressed():
	self.player.add_shop("shop1")
	self.hide()


func _on_Exit_pressed():
	self.hide()
