extends Popup

onready var label = $ColorRect/ColorRect/ConfirmLabel
onready var manage
signal done
signal not_enough_cash

func _ready():
	set_process_input(false)

func _on_YesButton_pressed():
	match manage:
		"Upgrade":
			manage_upgrade()
		"Hire":
			manage_hire()
	hide()
	set_process_input(false)

func _on_NoButton_pressed():
	hide()
	set_process_input(false)

func manage_upgrade():
	if player_have_enough_cash_upgrade():
		ShopState.upgrade_shop()
		emit_signal("done")
	else:
		emit_signal("not_enough_cash")

func player_have_enough_cash_upgrade() -> bool:
	return (ShopState.get_upgrade_value() <= Player.money)

func manage_hire():
	if player_have_enough_cash_hire():
		ShopState.add_employee()
		emit_signal("done")
	else:
		emit_signal("not_enough_cash")

func player_have_enough_cash_hire() -> bool:
	return (ShopState.get_add_employee_value() <= Player.money)

func set_label_hire():
	label.text = "CONFIRMAR EMPLEADO\n"
	label.text = "\nCOSTO: $"
	label.text += str(ShopState.get_add_employee_value())
	set_label_actual_balance()
	label.text += "\nGanancia con empleado: $"
	label.text += str(ShopState.earningWithNewEmployee())

func set_label_upgrade():
	label.text = "CONFIRMAR MEJORA\n"
	label.text = "\nCOSTO: $"
	label.text += str(ShopState.get_upgrade_value())
	set_label_actual_balance()
	label.text += "\nGanancia con mejora: $"
	label.text += str(ShopState.earningWithNewUpgrade())
	
func set_label_actual_balance():
	label.text += "\nDinero actual: $"
	label.text += str(Player.money)
	var earnings = Player.get_earnings_from(ShopState.shop_name)
	label.text += "\nGanancia actual: $"
	label.text += str(earnings)

func _on_ShopMenuManage_confirm_hire():
	manage = "Hire"
	popup()
	set_process_input(true)
	set_label_hire()

func _on_ShopMenuManage_confirm_upgrade():
	manage = "Upgrade"
	popup()
	set_process_input(true)
	set_label_upgrade()
