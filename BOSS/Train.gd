extends Sprite

var x_position = 4337.463
var stop_position = -5243.482
onready var area = $Area2D/CollisionShape2D

func _physics_process(delta):
	position.x -= delta * 400
	handle_area()
	
func handle_area():
	if(position.x < stop_position):
		position.x = x_position
	
	



