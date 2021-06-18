extends Area2D

var danceMinigame
export var speed = 80
var movement_direction = Vector2(0, 1)
signal arrow_deleted

func _ready():
	danceMinigame = get_tree().root.get_node("DanceMinigame")
	pass # Replace with function body.

func _process(delta):
	position = position + speed * delta * movement_direction

func verify_if_is_correct(direction):
	if direction == "right":
		danceMinigame.successful_arrow()
		_delete()
	else:
		danceMinigame.lose_life()

func move_down():
	pass

func screen_limit_reached():
	_delete()

func _delete():
	get_tree().queue_delete(self)
	emit_signal("arrow_deleted")
