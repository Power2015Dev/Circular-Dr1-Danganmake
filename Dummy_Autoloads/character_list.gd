extends Node
#This dictionary contains all the characters who are on the scene 
# and their emotions.
#"Hajime Hinata": {
		#"Sprites": "filepath/Hajime Hinata",
		#"Idle": "filepath/Hajime Hinata/Idle.png",
		#"Thinking": "filepath/Hajime Hinata/Thinking.png",
	#},
	#"Monokuma": {
		#"Sprites": "characters/characters_sprites/Monokuma",
		#"sitting": "characters/characters_sprites/Monokuma/sitting.png",
		#"sitting_laugh": "filepath/Monokuma/sitting_laugh.png"
var character_in_scene : Dictionary = {}

# This dictionary contains the 3D node of each instantiated character.
var character_in_scene_active_3D: Dictionary = {}

signal request_camera_focus(char_name: String, fov: int, speed: float)
signal request_camera_zoom_in_rotated(char_name: String, fov: int, duration: float, angle : float, Z_Pos : float, Y_Rot : float, speed : float)
signal request_camera_zoom_out_rotated(char_name: String, fov: int, duration: float, angle : float, Z_Pos : float, Y_Rot : float, speed : float)
signal request_camera_zoom_in(char_name: String, fov: int, duration: float, Z_Pos : float)
signal request_camera_zoom_out(char_name: String, fov: int, duration: float, Z_Pos : float)
signal request_camera_zoom_in_Top(char_name: String, fov: int, duration: float, Z_Pos : float)
signal request_slow_camera_L(char_name: String, fov: int)
signal request_slow_camera_R(char_name: String, fov: int)
signal request_camera_Down(char_name: String, fov: int, duration : float, speed: float, Z_Pos: float)
signal request_camera_Up(char_name: String, fov: int, duration : float, speed: float, Z_Pos: float)

signal FullScreen_afterimage
signal Orange_in
signal Orange_out

signal hide_courtroom
signal show_courtroom

func focus_CH(char_name: String, fov: int = 50, speed: float = 0.2): 
	request_camera_focus.emit(char_name, fov, speed)
func focus_CH_zoom_in_rotated(char_name: String, fov: int = 50, duration: float = 5.0, angle : float = -15.0, Z_Pos : float = 1.8, Y_Rot : float = 0, speed : float = 0.0): 
	request_camera_zoom_in_rotated.emit(char_name, fov, duration, angle, Z_Pos, Y_Rot, speed)
func focus_CH_zoom_out_rotated(char_name: String, fov: int = 50, duration: float = 5.0, angle : float = -15.0, Z_Pos : float = 1.8, Y_Rot : float = 0, speed : float = 0.0): 
	request_camera_zoom_out_rotated.emit(char_name, fov, duration, angle, Z_Pos, Y_Rot, speed)
func focus_CH_zoom_in(char_name: String, fov: int = 50, duration: float = 5.0, Z_Pos : float = 1.8): 
	request_camera_zoom_in.emit(char_name, fov, duration, Z_Pos)
func focus_CH_zoom_out(char_name: String, fov: int = 50, duration: float = 5.0, Z_Pos : float = 1.8): 
	request_camera_zoom_out.emit(char_name, fov, duration, Z_Pos)
func focus_CH_zoom_in_Top(char_name: String, fov: int = 50, duration: float = 5.0, Z_Pos : float = 1.8): 
	request_camera_zoom_in_Top.emit(char_name, fov, duration, Z_Pos)
func focus_CH_slow_camera_L(char_name: String, fov: int = 50): 
	request_slow_camera_L.emit(char_name, fov)
func focus_CH_slow_camera_R(char_name: String, fov: int = 50): 
	request_slow_camera_R.emit(char_name, fov)
func focus_CH_Down(char_name: String, fov: int = 50, duration: float = 5.0, speed: float = 0.2, Z_Pos: float = 1.8):
	request_camera_Down.emit(char_name, fov, duration, speed, Z_Pos)
func focus_CH_Up(char_name: String, fov: int = 50, duration: float = 5.0, speed: float = 0.2, Z_Pos: float = 1.8):
	request_camera_Up.emit(char_name, fov, duration, speed, Z_Pos)

func CH_EXPRESSION_3D(Character_name: String, expression: String):
	# This function checks the name you provided 
	# and searches for it among the 16 nodes in the scene
	# if it finds the node it selects it to change the expression
	# to the specified emotion.
	pass


func Wait(time: float):
	await get_tree().create_timer(time).timeout
func Show_Orange_filter():
	Orange_in.emit()
func Hide_Orange_filter():
	Orange_out.emit()
func fade_in(time: float):
	# Asynchronous fade-in
	pass
func fade_out(time: float):
	# Asynchronous fade-out
	pass
func fullscreen_afterimage():
	FullScreen_afterimage.emit()

func Hide_Courtroom():
	hide_courtroom.emit()
func Show_Courtroom():
	show_courtroom.emit()
