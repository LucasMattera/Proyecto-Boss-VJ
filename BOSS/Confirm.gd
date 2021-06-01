extends Popup

onready var label = $ColorRect/ColorRect/ConfirmLabel
signal purchased

func _ready():
	set_process_input(false)
	set_label()

func set_label():
	label.text = "CONFIRMAR COMPRA\nDinero actual: $"
	label.text += str(Player.money)
	label.text += "\nRequerido: -$"
	label.text += str(ShopState.value)
	label.text += "\nRestante: $"
	var res = Player.money - ShopState.value
	label.text += str(res)

func _on_ShopMenuBuy_confirm():
	popup()
	set_process_input(true)

func _on_YesButton_pressed():
	emit_signal("purchased")
	hide()
	set_process_input(false)

func _on_NoButton_pressed():
	hide()
	set_process_input(false)
