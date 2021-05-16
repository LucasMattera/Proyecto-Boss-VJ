extends Label

func _on_DanceMinigame_player_stats_changed(minigame):
	text = str(minigame.score)
