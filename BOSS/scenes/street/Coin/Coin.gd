extends Area2D

onready var value: int = 50
onready var collision = $CollisionShape2D
onready var valueLabel: Label = $ValueObtained/Value
onready var anim: AnimationPlayer = $ValueObtained/AnimationPlayer
onready var sprite: AnimatedSprite = $AnimatedSprite
onready var sfx: AudioStreamPlayer = $SFX
signal picked

func _ready():
	pass

func _on_Coin_body_entered(body):
	if body.name == "Player":
		sfx.play()
		emit_signal("picked", self)
		#Player.obtain_money(value, "Recoleccion en la calle")
		Player.money += value
		Player.last_earning = value
		Player.emit_signal("coin_picked", value)
		collision.disabled = true
		sprite.hide()
		valueLabel.text = "+ $" + str(value)
		anim.play("valueUp")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "valueUp":
		call_deferred("queue_free")
