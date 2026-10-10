extends CanvasLayer

# HERE YOU CAN START CREATING YOUR MINIGAME
# WARNING: DO NOT USE OPERATING SYSTEM FUNCTIONS OR HTTP REQUESTS.

var input_Keys : Array = []

func _ready() -> void:
	# Use _ready to declare which parameters are usable in the editor.
	# Editor_Parameters(true, false, false, false, true, false, false, false)
	# You can also add your own input maps here.
	# Custom_key("move_forwards", KEY_W)
	# Custom_Mouse_key("shoot", MOUSE_BUTTON_LEFT)
	pass

func Editor_Parameters(
	spin_box_1 : bool, 
	spin_box_2 : bool,
	spin_box_3 : bool,
	spin_box_4 : bool,
	linedit_1 : bool,
	linedit_2 : bool,
	linedit_3 : bool,
	linedit_4 : bool
	):
	
	GlobalStates.spin_1 = spin_box_1
	GlobalStates.spin_2 = spin_box_2
	GlobalStates.spin_3 = spin_box_3
	GlobalStates.spin_4 = spin_box_4
	GlobalStates.linedit_1 = linedit_1
	GlobalStates.linedit_2 = linedit_2
	GlobalStates.linedit_3 = linedit_3
	GlobalStates.linedit_4 = linedit_4

func Start_Minigame():
	# Don't declare start_minigame() in _ready 
	# unless you are testing the minigame itself.
	pass

func Win():
	for actions in input_Keys:
		if InputMap.has_action(actions):
			InputMap.erase_action(actions)
	
	GlobalStates.Player_won.emit()
func Lose():
	GlobalStates.Player_loss.emit()

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
