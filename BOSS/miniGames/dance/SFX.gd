extends AudioStreamPlayer

onready var fail = preload("res://assets/audio/sfx/dance/fail.wav")
onready var success = preload("res://assets/audio/sfx/dance/success.wav")
onready var game_over = preload("res://assets/audio/sfx/dance/game_over.wav")

func _on_DanceMinigame_fail():
	set_stream(fail)
	play()

func _on_DanceMinigame_success():
	set_stream(success)
	play()

func _on_DanceMinigame_game_over():
	set_stream(game_over)
	play()
