extends ColorRect

func _ready():
	hide()

func _on_PausePopup_exit():
	show()
