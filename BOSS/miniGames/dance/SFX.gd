extends AudioStreamPlayer

onready var fail = preload("res://assets/audio/sfx/dance/fail.wav")
onready var success = preload("res://assets/audio/sfx/dance/success.wav")
onready var cheers = preload("res://assets/audio/sfx/dance/cheers.ogg")

func _on_DanceMinigame_fail(_minigame):
	set_stream(fail)
	play()

func _on_DanceMinigame_success(_minigame):
	set_stream(success)
	play()

func _on_DanceMinigame_win_game(_money):
	set_stream(cheers)
	play()
