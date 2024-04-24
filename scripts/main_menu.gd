extends Control

class_name MainMenu

signal start_game # Signal to emit when the game starts

var main_menu_camera:Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Nice To Have : button animation 
	main_menu_camera = get_node("MainMenuCamera")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Called when the start button has been pressed
func _on_start_button_pressed():
	start_game.emit()

# Called when the quit button has been pressed
func _on_quit_button_pressed():
	get_parent().quit_game()
