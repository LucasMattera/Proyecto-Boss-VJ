extends Popup

onready var label = $ColorRect/ColorRect/ConfirmLabel
onready var manage
signal done

func _ready():
	set_process_input(false)

func _on_YesButton_pressed():
	match manage:
		"Upgrade":
			ShopState.upgrade_shop()
		"Hire":
			ShopState.add_employee()
	hide()
	set_process_input(false)
	emit_signal("done")

func _on_NoButton_pressed():
	hide()
	set_process_input(false)

func _on_ShopMenuManage_confirmUpgrade():
	manage = "Upgrade"
	popup()
	set_process_input(true)
	set_label_upgrade()

func _on_ShopMenuManage_confirmHire():
	manage = "Hire"
	popup()
	set_process_input(true)
	set_label_hire()

func set_label_hire():
	var earnings = Player.get_earnings_from(ShopState.shop_name)
	var res = ShopState.earningWithNewEmployee(earnings)
	label.text = "CONFIRMAR EMPLEADO\n"
	label.text = "\nCOSTO: $\n"
	label.text += str(res * 2)
	set_label_actual_balance()
	label.text += "\nGanancia con empleado: $"
	label.text += str(res)

func set_label_upgrade():
	var earnings = Player.get_earnings_from(ShopState.shop_name)
	var res = ShopState.earningWithNewUpgrade(earnings)
	label.text = "CONFIRMAR MEJORA\n"
	label.text = "\nCOSTO: $"
	label.text += str(res * 2)
	set_label_actual_balance()
	label.text += "\nGanancia con mejora: $"
	label.text += str(res)
	
func set_label_actual_balance():
	label.text += "\nDinero actual: $"
	label.text += str(Player.money)
	var earnings = Player.get_earnings_from(ShopState.shop_name)
	label.text += "\nGanancia actual: $"
	label.text += str(earnings)
