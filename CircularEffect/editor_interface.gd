extends VBoxContainer

@onready var insert: Button = $bg/VBoxContainer/insert
@onready var cancel: Button = $bg/VBoxContainer/cancel

signal insert_pressed
signal cancel_pressed

func _ready() -> void:
	insert.pressed.connect(_on_insert_button_down)
	cancel.pressed.connect(_on_cancel_button_down)

# Danganmake will call this function when you click insert or save
func get_data() -> Dictionary:
	var data = {}
	return data

# Danganmake will call this function when you click edit in the timeline
func set_data(saved_data: Dictionary) -> void:
	pass
	
func _on_insert_button_down():
	insert_pressed.emit()
func _on_cancel_button_down():
	cancel_pressed.emit()
