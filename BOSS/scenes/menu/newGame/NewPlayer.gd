extends Node2D

onready var level_one = load("res://Main.tscn")
onready var main_menu = load("res://Main_Tittle.tscn")
onready var input = $UI/Background/PanelInput/Input
onready var now_loading = $UI/NowLoading
onready var music = $BGM
onready var newPlayerTimer = $NewPlayerTimer
onready var confirmPopup = $UI/Confirm
var regEx_rule = "^(?=.{2,16}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"
signal confirm

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		_on_Cancel_pressed()

func _ready():
	input.grab_focus()

func _on_EnterName_pressed():
	var name = input.text
	var result = validate_name(name)
	if result != null:
		emit_signal("confirm", result.get_string())

func validate_name(name):
	var regex = RegEx.new()
	regex.compile(regEx_rule)
	return regex.search(name)

func _on_ConfirmCharacterButton_pressed():
	music.stop()
	now_loading.show()
	confirmPopup.hide()
	print("el nombre elegido es: ", input.text)
	Player.player_name = input.text
	newPlayerTimer.start()

func _on_Cancel_pressed():
	get_tree().change_scene_to(main_menu)

func _on_NewPlayerTimer_timeout():
	get_tree().change_scene_to(level_one)

func _on_CancelCharacter_pressed():
	confirmPopup.hide()


func _on_InitTimer_timeout():
	music.play()
