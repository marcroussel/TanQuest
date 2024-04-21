extends Control

class_name EnigmaPopup

signal popup_destroyed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Called when the exit button (or Esc key) is pressed
func _on_exit_button_pressed():
	popup_destroyed.emit()
	queue_free()
