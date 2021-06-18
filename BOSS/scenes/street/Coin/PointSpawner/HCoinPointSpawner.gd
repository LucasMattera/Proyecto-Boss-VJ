extends "res://scenes/street/Coin/PointSpawner/AbstractCoinPointSpawner.gd"

# Genera una posicion random en el segmento.
func randomGeneratePosition():
	var _res = .randomGeneratePosition()
	var positionX = rand_range(pointA.x, pointB.x)
	var positionY = fixedPointY
	return Vector2(positionX, positionY)

func _on_Timer_timeout():
	._on_Timer_timeout()
	var coinPosition = randomGeneratePosition()
	if check_collision_with_other_coins(coinPosition):
		create_coin(coinPosition)
