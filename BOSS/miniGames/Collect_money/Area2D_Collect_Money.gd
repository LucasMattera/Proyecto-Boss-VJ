extends Area2D

onready var exit = $Exit

func _on_Area2D_Collect_Money_body_entered(body):
	if body.is_in_group("player"):
		Player.can_move = false
		Player.global_position = exit.global_position
		if(Player.actual == 4):
			Player.next_objetive()
		GameServer.save_game()
		get_tree().change_scene("res://miniGames/Collect_money/Menu_Collect_Money.tscn") # Replace with function body.
