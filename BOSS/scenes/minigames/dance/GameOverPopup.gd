extends Popup

var minigame
signal retry
signal exit

func _ready():
	minigame = get_tree().root.get_node("DanceMinigame")
	set_process_input(false)

func game_over():
	set_process_input(true)
	popup_centered()
	get_tree().paused = true

func _on_Exit_pressed():
	print("loser_exit")
	emit_signal("exit")

func _on_Retry_pressed():
	print("loser_retry")
	emit_signal("retry")
