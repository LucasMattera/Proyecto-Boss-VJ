extends Node


onready var player = $Player
onready var shop = $Shop

# Called when the node enters the scene tree for the first time.
func _ready():
	player.initialize()
	shop.initialize(player)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
