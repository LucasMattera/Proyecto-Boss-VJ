extends Area2D



func _on_Area2D_Collect_Money_body_entered(body):
	if body.is_in_group("player"):
		Player.can_move = false
		Player.position.y = 1120
		Player.position.x = self.position.x 
		GameServer.save_game()
		get_tree().change_scene("res://miniGames/Collect_money/Menu_Collect_Money.tscn") # Replace with function body.
