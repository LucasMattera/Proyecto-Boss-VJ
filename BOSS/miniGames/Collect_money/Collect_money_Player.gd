extends KinematicBody2D
onready var animation = $Sprite
onready var cart= $cart
var velocity = 1
export (int) var money = 500
export (String) var player_name = "player 1"
var shops = []

func initialize():
	shops = Player.shops
	money = Player.money
	player_name = Player.player_name

func _physics_process(delta):
	if Input.is_action_pressed('move_right'):
		animation.animation = "right"
		cart.flip_h = false
		cart.position.x = + 50
		position.x += 3 * velocity
	if Input.is_action_pressed('move_left'):
		animation.animation = "left"
		cart.flip_h = true
		cart.position.x =  - 93
		position.x -= 3 * velocity
	if Input.is_action_pressed("run"):
		velocity = 2
	if Input.is_action_just_released("run"):
		velocity = 1
	if Input.is_action_just_pressed("pause"):
		self.get_parent().pause()
	position.y = 350
	move_and_slide(Vector2.DOWN, Vector2(0,-1))
