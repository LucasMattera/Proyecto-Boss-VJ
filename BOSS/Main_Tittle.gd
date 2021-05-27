extends Node2D

func _ready():
	print(GameServer.load_game())
	print(Player.money)


func _on_New_Game_pressed():
	get_tree().change_scene("res://Main.tscn") # Replace with function body.



func _on_Load_Game_pressed():
	var dataLoad = GameServer.load_game()
	Player.money = dataLoad.money
	Player.player_name = dataLoad.player_name
	Player.shops = dataLoad.shops
	Player.position.x = dataLoad.pos_x
	Player.position.y = dataLoad.pos_y
	
	
	get_tree().change_scene("res://Main.tscn") # Replace with function body.
