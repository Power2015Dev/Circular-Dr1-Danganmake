extends Node

signal Player_won
signal Player_loss
# maximum is 100 and minimun is 0.0
signal Hurt(Damage_taken : float)


func Play_iSee():
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
	
func Play_iSee_char_selection(char : String):
	# its almost the same the diference here it is not exclusive to the main character
	# you can apply it to any character.
	# it is an asynchronous function.
	pass
	
func Play_Counter(character : String = ""):
	# This will instantiate the Counter Screen to display it
	# it is an asynchronous function.
	pass
	
func Play_Consent(main_char : String, secondary_char : String):
	# This will instantiate the Consent Screen to display it
	# it is an asynchronous function.
	pass
func Show_Health_bar():
	pass
func Hide_Health_bar():
	pass
