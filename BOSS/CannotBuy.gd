extends Popup

func _ready():
	set_process_input(false)

func _on_ShopMenuBuy_not_enough_cash():
	set_process_input(true)
	popup()

func _on_CannotBuyButton_pressed():
	set_process_input(false)
	show()


func _on_ShopMenuBuy_purchased():
	pass # Replace with function body.
