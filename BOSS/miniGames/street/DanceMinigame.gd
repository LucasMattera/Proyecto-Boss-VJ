extends Area2D

func _on_DanceMinigame_body_entered(body):
	if body.name == "Player":
		# Remove the current level
		get_tree().change_scene("res://miniGames/dance/DanceMinigame.tscn")
		Player.can_move = false
		Player.position.y = self.position.y + 100
		Player.position.x = self.position.x 
		GameServer.save_game()
