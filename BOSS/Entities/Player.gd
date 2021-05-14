extends KinematicBody2D

export (int) var speed = 400
var velocity:Vector2 = Vector2.ZERO
onready var camera = $Camera2D
export (int) var zoomInLimit = 9
export (int) var zoomOutLimit = 1
export (int) var money = 500
export (String) var player_name = "player 1"
var shops = []


func initialize():
	pass
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	if Input.is_action_pressed('run'):
		velocity = velocity * 2
	if Input.is_action_pressed("zoom-out") and camera.zoom.x <= zoomInLimit:
		camera.zoom.x += 0.2
		camera.zoom.y += 0.2
	if Input.is_action_pressed("zoom-in") and camera.zoom.x >= zoomOutLimit:
		camera.zoom.x -= 0.2
		camera.zoom.y -= 0.2
	if (Input.is_action_just_pressed("work_hard")):
		print("se trabaja")
		self.money += 20
		actualizeMoney(self.money)
		print("ganaste 20 pesos")
		
func get_camera_position():
	return camera.get_global_position()
	
func is_player():
	return true
	
func buy(shop):
	if(money >= 100):
		self.shops.append(shop)
		self.money -= 100
		actualizeMoney(self.money)
		print('compraste ')
		print(shop)
		print('tus locales son ')
		print(self.shops)
		print('plata restante: ')
		print(self.money)
	else:
		print('no te alcanza... ')

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

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


func recollect_money():
	print('Ganancia por locales :')
	print(self.shops.size())
	self.money += self.shops.size()
	actualizeMoney(self.money)
	print('dinero actual: ' )
	print(self.money)
	
func actualizeMoney(value):
	get_parent().doActualize(value)
