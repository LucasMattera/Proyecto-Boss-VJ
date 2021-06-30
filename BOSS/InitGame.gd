extends Node2D

onready var label1 = $Backgrond/Label
onready var button = $Backgrond/Sprite
onready var continue_game = $Continue

func _on_Continue_pressed():
	get_tree().change_scene("res://scenes/menu/newGame/NewPlayer.tscn")


func _on_PrincipalMenu_pressed():
	get_tree().change_scene("res://Main_Tittle.tscn")


func _on_ContinueMenu_pressed():
	label1.hide()
	button.show()
	continue_game.show()
	
