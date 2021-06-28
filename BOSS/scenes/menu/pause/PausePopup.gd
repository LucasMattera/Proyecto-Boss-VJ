extends Popup

onready var exitTimer = $ExitTimer
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
	exitTimer.start()

func _on_GUI_pause():
	popup_centered()
	#show()
	get_tree().paused = true
	set_process_input(true)

func _on_Player_pause():
	_on_GUI_pause()

func _on_ExitTimer_timeout():
	get_tree().change_scene("res://Main.tscn");
