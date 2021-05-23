extends AnimatedSprite
var gravity = 5
var value
var my_random_value
var my_random_pos

func _ready():

	pass
	#my_random_value = rng.randf_range(0, 1000)
	
func get_value():
	var rngv = RandomNumberGenerator.new()
	rngv.randomize()
	var value = rngv.randi_range(-1000, 1000)
	return value
	
func initialize(pos):
	value = value
	position.x = pos
	position.y = 0	
	
func _physics_process(delta):
	position.y += gravity
	if position.y > 600:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Player.money += value
		queue_free()
