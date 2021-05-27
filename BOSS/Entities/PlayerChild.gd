extends KinematicBody2D

onready var animation = $Sprite
export (int) var speed = 400
var velocity:Vector2 = Vector2.ZERO
var can_move = true
export (int) var zoomInLimit = 9
export (int) var zoomOutLimit = 1
export (int) var money = 500
export (String) var player_name = "player 1"
var shops = []

func _ready():
	# Create a timer node
	var timer = Timer.new()
	# Set timer interval
	timer.set_wait_time(1.5)
	# Set it as repeat
	timer.set_one_shot(false)
	# Connect its timeout signal to the function you want to repeat
	timer.connect("timeout", self, "recollect_money")
	# Add to the tree as child of the current node
	add_child(timer)
	timer.start()

func initialize():
	shops = Player.shops
	money = Player.money
	Player.player_name = player_name 
	position = Player.position
	animation.animation = "idle"
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('move_right'):
		animation.animation = "right"
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		animation.animation = "left"
		velocity.x -= 1
	if Input.is_action_pressed('move_down'):
		animation.animation = "down"
		velocity.y += 1
	if Input.is_action_pressed('move_up'):
		animation.animation = "up"
		velocity.y -= 1
	if Input.is_action_just_released("move_down") || Input.is_action_just_released("move_right") || Input.is_action_just_released("move_left") || Input.is_action_just_released("move_up"): 
		animation.animation = "idle"
	velocity = velocity.normalized() * speed
	if Input.is_action_pressed('run'):
		velocity = velocity * 2
	if (Input.is_action_just_pressed("work_hard")):
		print("se trabaja")
		self.money += 20
		actualizeMoney(self.money)
		print("ganaste 20 pesos")
	Player.velocity = velocity
	Player.money = money
		
func is_player():
	return true
	
func buy(shop):
	if(money >= 100) && !shops.has(shop):
		Player.shops.append(shop)
		self.money -= 100
		Player.money -= 100
		actualizeMoney(self.money)
		print('compraste ')
		print(shop)
		print('tus locales son ')
		print(self.shops)
		print('plata restante: ')
		print(self.money)
	else:
		print('no te alcanza...')

func _physics_process(delta):
	if(can_move):
		get_input()
		velocity = move_and_slide(velocity)

func recollect_money():
	print('Ganancia por locales :')
	print(self.shops.size())
	for shop in self.shops:
		self.money += shop.earnings
	Player.money = self.money
	actualizeMoney(self.money)
	print('dinero actual: ' )
	print(self.money)
	
func actualizeMoney(value):
	#self.money = value	
	GameServer.save_game()
	print("guardado")

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
		"money": money,
		"player_name": player_name,
		"shops": shops
	}
	return save_dict
