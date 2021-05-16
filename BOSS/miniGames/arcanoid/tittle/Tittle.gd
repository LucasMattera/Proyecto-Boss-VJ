extends Node

var player

func initialize(player):
	player = player

func _ready():
	pass # Replace with function body.


func _on_start_pressed():
	
	get_tree().change_scene("res://miniGames/arcanoid/world.tscn")

func _on_quit_pressed():
	get_tree().change_scene("res://main.tscn")
