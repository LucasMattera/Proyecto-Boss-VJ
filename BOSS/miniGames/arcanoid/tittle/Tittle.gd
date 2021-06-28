extends Node
onready var start = $start
onready var start_label = $start/Label
var player

func initialize(player):
	player = player

func _ready():
	if Player.money < 1000:
		start.disabled = true
		start_label.add_color_override("font_color", Color(0,0,0,0))

func _on_start_pressed():
	get_tree().change_scene("res://miniGames/arcanoid/world.tscn")


func _on_quit_pressed():
	get_tree().change_scene("res://main.tscn")
