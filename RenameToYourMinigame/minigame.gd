extends CanvasLayer

# HERE YOU CAN START CREATING YOUR MINIGAME
# WARNING: DO NOT USE OPERATING SYSTEM FUNCTIONS OR HTTP REQUESTS.

var input_Keys : Array = []

func _ready() -> void:
	# You can add your own input maps here.
	# Custom_key("move_forwards", KEY_W)
	# Custom_Mouse_key("shoot", MOUSE_BUTTON_LEFT)
	pass

func Start_Minigame(param : Dictionary):
	# Don't declare start_minigame() in _ready 
	# unless you are testing the minigame itself.
	pass

func Win():
	# deleting the inputs you declared after win
	for actions in input_Keys:
		if InputMap.has_action(actions):
			InputMap.erase_action(actions)
	
	GlobalStates.Player_won.emit()
func Lose():
	GlobalStates.Player_lose.emit()

func Custom_key(action: String, key: Key) -> void:
	if not InputMap.has_action(action):
		InputMap.add_action(action)
		var evento = InputEventKey.new()
		evento.keycode = key
		input_Keys.append(action)
		InputMap.action_add_event(action, evento)

func Custom_Mouse_key(action : String, MouseEvent: MouseButton) -> void:
	if not InputMap.has_action(action):
		InputMap.add_action(action)
		var evento = InputEventMouseButton.new()
		evento.button_index = MouseEvent
		input_Keys.append(action)
		InputMap.action_add_event(action, evento)

func _exit_tree() -> void:
	for action in input_Keys:
		if InputMap.has_action(action):
			InputMap.erase_action(action)
	input_Keys.clear()
