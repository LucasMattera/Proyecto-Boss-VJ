extends Area2D

onready var exit = $Exit

func _on_DanceMinigame_body_entered(body):
	if body.name == "Player":
		# Remove the current level
		get_tree().change_scene("res://miniGames/dance/DanceMinigame.tscn")
		Player.can_move = false
		Player.global_position = exit.global_position
		GameServer.save_game()
