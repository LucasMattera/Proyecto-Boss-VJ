extends Node2D

export (PackedScene) var coin_scene
onready var segment: CollisionShape2D = $CoinPointY/Segment
onready var coinPointY: Area2D = $CoinPointY

func _ready():
	pass


func _on_Timer_timeout():
	var coin = coin_scene.instance()
	var positionY = coinPointY.position.y
	var positionX = rand_range(segment.shape.a.x, segment.shape.b.x)
	coin.position = Vector2(positionX, positionY)
	add_child(coin)
