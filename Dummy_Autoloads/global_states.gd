extends Node

signal Player_won
signal Player_loss
# maximum is 100 and minimun is 0.0
signal Hurt(Damage_taken : float)

#Spinbox
var spin_1 : bool = false
var spin_2 : bool = false
var spin_3 : bool = false
var spin_4 : bool = false

#Line edit
var linedit_1 : bool = false
var linedit_2 : bool = false
var linedit_3 : bool = false
var linedit_4 : bool = false

func begin_isee_anim():
	# This will instantiate the I_SEE to display it
	# it is an asynchronous function.
	# This is an example how the game do it
	# Don't uncomment it, because it's an example
	# the game will know where the scene is. 
	#
	# var instance = Isee_scene.instantiate()
	# get_tree().current_scene.add_child(instance)
	# instance.Prepare()
	# await instance.Play()
	pass
	
func Counter_Screen():
	# This will instantiate the Counter Screen to display it
	# it is an asynchronous function.
	pass
	
func Consent_Screen():
	# This will instantiate the Consent Screen to display it
	# it is an asynchronous function.
	pass
func Show_Health_bar():
	pass
func Hide_Health_bar():
	pass
