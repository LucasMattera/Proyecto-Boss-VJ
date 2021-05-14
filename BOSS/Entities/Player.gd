extends KinematicBody2D

export (int) var speed = 400
var velocity:Vector2 = Vector2.ZERO
onready var camera = $Camera2D
export (int) var zoomInLimit = 9
export (int) var zoomOutLimit = 1


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
		
		
func get_camera_position():
	return camera.get_global_position()
	
func is_player():
	return true
	
func add_shop(shop):
	print(shop)

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
