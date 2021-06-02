extends Popup

onready var label = $ColorRect/ColorRect/PurchasedLabel

func _ready():
	set_process_input(false)

func _on_ShopMenuBuy_purchased():
	set_process_input(true)
	popup()

func _on_PurchasedButton_pressed():
	set_process_input(false)
	hide()
	get_tree().change_scene("res://ShopManageMenu.tscn")
