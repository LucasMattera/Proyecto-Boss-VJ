extends AudioStreamPlayer

const TRACKS = [ 'takitaki', 'tuAngelito', 'x']

func _ready():
	play_random_music()

func play_random_music():
	var rand_nb = randi() % TRACKS.size()
	var audiostream = load('res://assets/audio/music/dance/' + TRACKS[rand_nb] + '.ogg')
	set_stream(audiostream)
	play()


func _on_DanceMinigame_game_over():
	stop()
