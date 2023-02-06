extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var gameDifficulty: Button = self.get_child(1)


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Game Difficulty".get_popup().add_item("Easy")
	$"Game Difficulty".get_popup().add_item("Normal")
	$"Game Difficulty".get_popup().add_item("Hard")
	
	$"Game Difficulty".get_popup().connect("id_pressed", self, "_difficultySelection")

func _difficultySelection(id):
	if (id == 0):
		GlobalVariables.difficulty = "Easy"
		$"Game Difficulty".text = "Easy"
	elif (id == 1):
		GlobalVariables.difficulty = "Normal"
		$"Game Difficulty".text = "Normal"
	else:
		GlobalVariables.difficulty = "Hard"
		$"Game Difficulty".text = "Hard"

func _on_Desert_toggled(button_pressed):
	GlobalVariables.map_selection = "Desert"

func _on_Tower_toggled(button_pressed):
	GlobalVariables.map_selection = "Tower"
	
func _on_Volcano_toggled(button_pressed):
	GlobalVariables.map_selection = "Volcano"
	
func _on_Mountain_toggled(button_pressed):
	GlobalVariables.map_selection = "Mountain"



