extends CanvasLayer

# HERE YOU CAN START CREATING YOUR MINIGAME
# WARNING: DO NOT USE OPERATING SYSTEM FUNCTIONS OR HTTP REQUESTS.

var input_Keys : Array = []

var persistent_state : bool = true

@export var letters_speed : float = 12.0:
	set(v):
		letters_speed = v
		_Speed_apply()

@export var intro_speed : float = 1.0:
	set(v):
		intro_speed = v
		_Speed_apply()

const Base_rotation := 12.0

@onready var anim_intro: AnimationPlayer = $AnimIntro
@onready var anim_letras: AnimationPlayer = $AnimLetras

func _ready() -> void:
	# You can add your own input maps here.
	# Custom_key("move_forwards", KEY_W)
	# Custom_Mouse_key("shoot", MOUSE_BUTTON_LEFT)

	# if you make persistent_state = true
	# it wont' destroy the scene after you emit the Player_won signal
	# useful for HUD things that you want to make it stay

	_Speed_apply()
	_prepare()


	#Start_Minigame({})

func Start_Minigame(param : Dictionary):
	# Don't declare start_minigame() in _ready
	# unless you are testing the minigame itself.
	
	var actual_balloon = GlobalStates.get_current_balloon()
	if is_instance_valid(actual_balloon):
		actual_balloon.tree_exited.connect(_on_tree_exiting)
	
	if param.get("toggle", false) == true:
		_play_intro()
		anim_letras.play("giro_togglevisibility")
	else:
		anim_letras.play("giro")
		Win.call_deferred()


func _prepare() -> void:
	anim_intro.play("intro")
	anim_intro.seek(0.0, true)
	anim_intro.pause()

func _play_intro() -> void:
	anim_intro.play("intro")
	anim_intro.seek(0.0, true)

func play_sound():
	GlobalSound.Load_SFX("TRIALINTRONOISEDR1")

func _Speed_apply() -> void:
	if is_instance_valid(anim_intro):
		anim_intro.speed_scale = intro_speed
	if is_instance_valid(anim_letras):
		anim_letras.speed_scale = letters_speed / Base_rotation

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

func _on_tree_exiting():
	self.queue_free()
