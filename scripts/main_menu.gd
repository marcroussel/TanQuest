extends Control

class_name MainMenu
var main_menu_camera:Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Nice To Have : button animation 
	main_menu_camera = get_node("MainMenuCamera")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

