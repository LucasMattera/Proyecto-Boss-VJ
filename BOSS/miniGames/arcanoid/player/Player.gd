extends KinematicBody2D

const RIGHT: int = 1
const LEFT : int = -1
var gameStarted : bool = false
export var speed : int = 4

# es para ejecutar 1 vez
#func _input(event):
#	if event.is_action_pressed("move_right"):
#		position.x = position.x + speed
#	if event.is_action_pressed("move_left"):
#		position.x = position.x - speed

func _ready():
	pass
	
func _physics_process(delta):
	if gameStarted:
		if Input.is_action_pressed("move_right"):
			var movement : Vector2 = Vector2(speed,0)
			move_and_collide(movement)
		if Input.is_action_pressed("move_left"):
			var movement : Vector2 = Vector2(-speed, 0)
			move_and_collide(movement)
	if Input.is_action_pressed("start") && not gameStarted:
		get_parent().label.hide()
		gameStarted = true
