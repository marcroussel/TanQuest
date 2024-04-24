extends CanvasLayer

class_name Hud

# Called when the node enters the scene tree for the first time.
func _ready():
	_hide_pause_menu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Used to show the pause button and hide the pause menu
func _hide_pause_menu():
	$PauseButton.show()
	$PauseMenuContainer.hide()
	
	# We unfreeze the player
	get_parent().unfreeze_player()


# Called when the pause button has been pressed
func _show_pause_menu():
	
	# We hide the pause button and show the pause menu
	$PauseButton.hide()
	$PauseMenuContainer.show()
	
	# We freeze the player
	get_parent().freeze_player()

## ----- EVENT PROCEDURES FOR PAUSE MENU BUTTONS ----- ##

func _on_resume_button_pressed():
	_hide_pause_menu() # We hide the pause menu


func _on_main_menu_button_pressed():
	_hide_pause_menu() # We hide the pause menu
	get_parent().start_main_menu() # We go back to main menu


func _on_quit_button_pressed():
	_hide_pause_menu() # We hide the pause menu
	get_parent().quit_game() # We quit the game
