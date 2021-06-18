extends CanvasLayer

onready var score = $Score/ScorePoints
onready var life = $Lives/LifePoints
onready var game_over = $GameOverPopup
onready var arrow_spawner = $ArrowSpawner
onready var game_win = $GameWinPopup
onready var combo = $Combo
onready var ring = $Ring
onready var money_earned = $MoneyEarned

signal arrow_in_ring
signal arrow_out_of_ring
signal arrow_out_of_screen
signal loser_retry
signal player_exit
signal last_arrow_out

func _on_DanceMinigame_player_stats_changed(minigame):
	score._update(minigame)
	life._update(minigame)

func _on_Ring_area_entered(arrow):
	emit_signal("arrow_in_ring", arrow)

func _on_Ring_area_exited(arrow):
	emit_signal("arrow_out_of_ring", arrow)

func _on_ScreenLimit_area_entered(arrow):
	arrow.screen_limit_reached()
	emit_signal("arrow_out_of_screen")

func _on_DanceMinigame_game_over(money):
	game_over.game_over(money)
	free_arrows()

func _on_GameOverPopup_retry():
	emit_signal("loser_retry")

func _on_DanceMinigame_win_game(accumulated_money: int):
	game_win.win_game(accumulated_money)
	arrow_spawner.stop()
	#stop_arrows()

func _on_GameWinPopup_player_exit():
	emit_signal("player_exit")

func _on_GameReadyPopup_player_exit():
	emit_signal("player_exit")

func _on_GameOverPopup_exit():
	emit_signal("player_exit")

func _on_DanceMinigame_fail(minigame):
	combo.fail(minigame)

func _on_DanceMinigame_success(minigame):
	ring.success()
	combo.success(minigame)

func _on_ArrowSpawner_last_arrow():
	emit_signal("last_arrow_out")

func free_arrows():
	if arrow_spawner != null:
		arrow_spawner.call_deferred('free')

func _on_DanceMinigame_money_earned(amount):
	money_earned.earn_money(amount)
