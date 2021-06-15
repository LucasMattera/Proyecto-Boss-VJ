extends Control

onready var amountLabel: Label = $Amount
onready var anim: AnimationPlayer = $MoneyUp

func ready():
	hide()

func earn_money(money: int):
	show()
	amountLabel.text = "+ $"
	amountLabel.text += str(money)
	anim.play("up")


func _on_MoneyUp_animation_finished(anim_name):
	hide()
	amountLabel.text = ""
