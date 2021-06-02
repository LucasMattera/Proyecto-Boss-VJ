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
	label.text = "CONFIRMAR EMPLEADO\n"
	set_label_actual_balance()
	label.text += "\nGanancia con empleado: $"
	var res = ShopState.earningWithNewEmployee()
	label.text += str(res)

func set_label_upgrade():
	label.text = "CONFIRMAR MEJORA\n"
	set_label_actual_balance()
	label.text += "\nGanancia con mejora: $"
	var res = ShopState.earningWithNewUpgrade()
	label.text += str(res)
	
func set_label_actual_balance():
	label.text += "Dinero actual: $"
	label.text += str(Player.money)
	label.text += "\nGanancia actual: $"
	label.text += str(ShopState.earnings)
