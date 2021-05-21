extends Popup

var minigame
signal player_exit

func _ready():
	minigame = get_tree().root.get_node("DanceMinigame")
	begin_game()

func begin_game():
	set_process_input(true)
	popup_centered()
	get_tree().paused = true

func _on_Exit_pressed():
	hide()
	set_process_input(false)
	get_tree().paused = false
	emit_signal("player_exit")

func _on_Begin_pressed():
	hide()
	set_process_input(false)
	get_tree().paused = false
