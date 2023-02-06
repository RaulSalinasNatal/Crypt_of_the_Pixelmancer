extends Node2D

func _ready():
	$TimeMessage.text = "Has completado The Cript of the Pixelmancer en " + GlobalVariables.time + " minutos"
	

func _input(event):
	if Input.is_action_pressed('resetScene'):
		get_tree().change_scene("res://scenes/levels/proceduralGeneration.tscn")
