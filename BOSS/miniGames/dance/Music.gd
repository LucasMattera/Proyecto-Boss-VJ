extends AudioStreamPlayer

const TRACKS = [ 'takitaki', 'tuAngelito', 'x']
onready var winner = load("res://assets/audio/music/dance/winner.wav")
onready var loser = load("res://assets/audio/music/dance/loser.wav")

func _ready():
	play_random_music()

func play_random_music():
	var rand_nb = randi() % TRACKS.size()
	var audiostream = load('res://assets/audio/music/dance/' + TRACKS[rand_nb] + '.ogg')
	set_stream(audiostream)
	play()

func _on_DanceMinigame_game_over():
	set_stream(loser)
	play()

func _on_DanceMinigame_win_game(_money):
	set_stream(winner)
	play()


func _on_Star_Player_pause():
	pass#pause_mode = true
