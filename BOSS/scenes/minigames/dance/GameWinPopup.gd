extends Popup

var minigame
signal winner_exit

func _ready():
	minigame = get_tree().root.get_node("DanceMinigame")
	set_process_input(false)

func win_game():
	set_process_input(true)
	popup_centered()
	get_tree().paused = true

func _on_Exit_pressed():
	hide()
	set_process_input(false)
	get_tree().paused = false
	emit_signal("winner_exit")
