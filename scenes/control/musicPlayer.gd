extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var exploringMusic = load("res://music/AAOCG - mIRC 6 x - KeyGen Sound - by Done.ogg")
var lowHealthMusic = load("res://music/Low-HP.ogg")
var playLowHealthMusic = false

# Called when the node enters the scene tree for the first time.
func _ready():
	playMusic()
	
func playMusic():
	$music.stream = exploringMusic
	$music.play()
	
func playLowHealth(boolean):
	playLowHealthMusic = boolean

func playLowMusic():
	$music.stream = lowHealthMusic
	$music.play()
	playLowHealthMusic = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playLowHealthMusic:
		playLowMusic()
