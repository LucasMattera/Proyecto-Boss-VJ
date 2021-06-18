extends Popup

signal exit

func _ready():
	hide()

func _on_Continue_pressed():
	hide()
	set_process_input(false)
	get_tree().paused = false

func _on_Exit_pressed():
	set_process_input(false)
	get_tree().paused = false
	hide()
	emit_signal("exit")

func _on_GUI_pause():
	show()
	get_tree().paused = true
	set_process_input(true)
	popup_centered()
