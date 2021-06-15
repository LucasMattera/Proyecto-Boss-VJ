extends Node
onready var start = $start
var player

func initialize(player):
	player = player

func _ready():
	if Player.money < 1000:
		start.disabled = true
		


func _on_start_pressed():
	get_tree().change_scene("res://miniGames/arcanoid/world.tscn")
		

func _on_quit_pressed():
	get_tree().change_scene("res://main.tscn")
