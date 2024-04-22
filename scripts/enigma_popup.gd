extends Control

class_name EnigmaPopup

@export var osciloscope : Osciloscope

signal popup_destroyed
signal enigma_solved
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func load(difficulty,a,b,c):
	osciloscope.load(difficulty,a,b,c)
	pass


# Called when the exit button (or Esc key) is pressed
func _on_exit_button_pressed():
	print("destroying popup")
	popup_destroyed.emit()
	queue_free()


func _on_osciloscope_enigma_solved():
	_on_exit_button_pressed()
	enigma_solved.emit()
	pass
