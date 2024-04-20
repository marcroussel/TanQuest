extends Control

class_name EnigmaPopup
var exit_button:Button

# Called when the node enters the scene tree for the first time.
func _ready():
	exit_button = get_node("ExitButton")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Called when the exit button (or Esc key) is pressed
func _on_exit_button_pressed():
	pass
