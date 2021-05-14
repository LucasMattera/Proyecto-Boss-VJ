extends CanvasLayer

var minigame
signal arrow_in_ring
signal arrow_out_of_ring
signal arrow_out_of_screen
signal loser_exit
signal loser_retry
signal discount_arrow
signal winner_exit

func set_minigame(minigame):
	minigame = minigame

func _on_DanceMinigame_player_stats_changed(minigame):
	$Score/ScorePoints._update(minigame)
	$Lives/LifePoints._update(minigame)

func _on_Ring_area_entered(arrow):
	emit_signal("arrow_in_ring", arrow)

func _on_Ring_area_exited(arrow):
	emit_signal("arrow_out_of_ring", arrow)

func _on_ScreenLimit_area_entered(arrow):
	print("delete")
	arrow.screen_limit_reached()
	emit_signal("arrow_out_of_screen")

func _on_DanceMinigame_game_over():
	$GameOverPopup.game_over()

func _on_GameOverPopup_exit():
	emit_signal("loser_exit")

func _on_GameOverPopup_retry():
	emit_signal("loser_retry")

func _on_DanceMinigame_win_game():
	$GameWinPopup.win_game()

func _on_GameWinPopup_winner_exit():
	emit_signal("winner_exit")
