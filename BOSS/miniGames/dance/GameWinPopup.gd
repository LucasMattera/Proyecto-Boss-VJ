extends Popup

var minigame
signal player_exit

func _ready():
	minigame = get_tree().root.get_node("DanceMinigame")
	set_process_input(false)

func win_game():
	set_process_input(true)
	popup_centered()
	get_tree().paused = true

func _on_Exit_pressed():
	set_process_input(false)
	get_tree().paused = false
	hide()
	emit_signal("player_exit")
