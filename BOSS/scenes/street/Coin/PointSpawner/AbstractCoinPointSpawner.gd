extends Area2D

onready var fixedPointY = position.y
onready var fixedPointX = position.x
onready var segment = $Segment.shape
onready var timer = $Timer
onready var coins = []
export (int) onready var spawnDistance
export (PackedScene) var coinScene
export (Vector2) onready var initialPosition
export (Vector2) onready var pointA
export (Vector2) onready var pointB

#ToDo: Hacer puntos variables y fijos,
# dependiendo si es horiz o verti.
# clase abstracta. concreta diferencia H de V
# Sonido de monedas.
# Dinero agregado al jugador.


func _ready():
	self.position = initialPosition
	segment.a = pointA
	segment.b = pointB
	_on_Timer_timeout() # 1er tanda de monedas

# Crea una nueva moneda en cada timeout.
func _on_Timer_timeout():
	pass

# Genera una posicion random en el segmento.
func randomGeneratePosition():
	#var positionX = rand_range(pointA.x, pointB.x)
	#var positionY = fixedPointY
	return Vector2(0, 0) #Vector2(positionX, positionY)

# Chequea que haya buena distancia entre monedas.
func check_collision_with_other_coins(newCoinPosition):
	for coin in coins:
		var distanceToCoin = newCoinPosition.distance_to(coin.position)
		if distanceToCoin < spawnDistance:
			return false
	return true

func create_coin(coinPosition):
	var coin = coinScene.instance()
	coin.position = coinPosition
	add_child(coin)
	coins.append(coin)
	coin.connect("picked", self, "_on_Coin_picked")

func _on_Coin_picked(coin):
	coins.erase(coin)
