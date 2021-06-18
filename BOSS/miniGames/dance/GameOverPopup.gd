extends Popup

var minigame
onready var description = $ColorRect/Label
signal retry
signal exit

func _ready():
	minigame = get_tree().root.get_node("DanceMinigame")
	set_process_input(false)

func game_over(money):
	get_tree().paused = true
	set_process_input(true)
	popup_centered()
	description.text += str(money)

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
