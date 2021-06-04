extends Popup

var minigame
signal retry
signal exit

func _ready():
	minigame = get_tree().root.get_node("DanceMinigame")
	set_process_input(false)

func game_over():
	get_tree().paused = true
	set_process_input(true)
	popup_centered()

func _on_Exit_pressed():
	get_tree().paused = false
	hide()
	set_process_input(false)
	emit_signal("exit")
	
func _on_Retry_pressed():
	get_tree().paused = false
	hide()
	set_process_input(false)
	emit_signal("retry")
