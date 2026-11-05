extends VBoxContainer

@onready var insert: Button = $bg/VBoxContainer/insert
@onready var cancel: Button = $bg/VBoxContainer/cancel
@onready var button: Button = $bg/VBoxContainer/Button
var toogle : bool = false

signal insert_pressed
signal cancel_pressed

func _ready() -> void:
	insert.pressed.connect(_on_insert_button_down)
	cancel.pressed.connect(_on_cancel_button_down)

# Danganmake will call this function when you click insert or save
func get_data() -> Dictionary:
	var data = {
		"toggle": toogle
	}
	return data

# Danganmake will call this function when you click edit in the timeline
func set_data(saved_data: Dictionary) -> void:
	if saved_data.has("toggle"):
		if saved_data["toggle"]:
			button.toggled.emit()
			button.text = "Toggle intro animation: activated"
	
	
func _on_insert_button_down():
	insert_pressed.emit()
func _on_cancel_button_down():
	cancel_pressed.emit()


func _on_button_toggled(toggled_on: bool) -> void:
	toogle = toggled_on
	if toggled_on:
		button.text = "Toggle intro animation: activated"
	else:
		button.text = "Toggle intro animation: deactivate"
