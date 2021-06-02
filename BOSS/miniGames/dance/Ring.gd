extends Area2D

func _ready():
	pass # Replace with function body.

func _on_Ring_body_entered(body):
	print("body entered")

func _on_Ring_area_entered(area):
	print("area entered")

func success():
	$Circle.play("success")

func _on_Circle_animation_finished():
	$Circle.play("idle")
