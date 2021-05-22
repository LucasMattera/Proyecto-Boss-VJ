extends Node2D

var player 
onready var menu = $Menu
export (String) var shop_name = "shop"

func initialize(player):
	menu.set_shop_name(shop_name)
	self.player = player
	
func get_name():
	return self.shop_name
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		menu.initialize(body)
		menu.show()
	
