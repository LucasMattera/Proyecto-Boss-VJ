extends Node2D

func _ready():
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_Upgrade_pressed():
	ShopState.upgrade_shop()
	get_tree().change_scene("res://Main.tscn")


func _on_AddEmployee_pressed():
	ShopState.add_employee()
	get_tree().change_scene("res://Main.tscn")
