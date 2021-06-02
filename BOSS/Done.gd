extends Popup

onready var label = $ColorRect/ColorRect/DoneLabel

func _ready():
	set_process_input(false)

func _on_DoneButton_pressed():
	set_process_input(false)
	hide()

func _on_Confirm_done():
	popup()
	set_process_input(true)

