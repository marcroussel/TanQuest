extends Node

const DEFAULT_PLAYER_POSITION_X = 290
const DEFAULT_PLAYER_POSITION_Y = 304
const DEFAULT_PLAYER_CAMERA_ZOOM = 3

@export var number_of_keys:int = 0
@export var enigma_popup:PackedScene

var is_popup_created = false

# Called at the begining of the whole program
func _ready():
	# We make the start menu appear
	start_main_menu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Used to freeze the player
func freeze_player():
	$Player/Player.freezed = true;

# Used to unfreeze the player
func unfreeze_player():
	$Player/Player.freezed = false;

# Used to make the main menu appear
func start_main_menu():
	
	# Hiding player and GameTile and showing MainMenu
	$GameTileMap.hide()
	$Player.hide()
	$MainMenu.show()
	
	# We freeze the player
	freeze_player()
	
	# Switching to main_menu_camera
	$MainMenu.main_menu_camera.make_current()
	
	# Connecting the start_game signal to start_game function
	$MainMenu.start_game.connect(start_game)
	
	$HUD.hide()

# Used to quit completely the game 
func quit_game():
	get_tree().quit()

## ---------- EVENT PROCEDURES ---------- ##

# Called when the game starts, when the start_game signal has
# been emited by the start button
func start_game():
	
	# Setting the default player's position
	$Player.position = Vector2(DEFAULT_PLAYER_POSITION_X, DEFAULT_PLAYER_POSITION_Y)
	
	# Showing player and GameTile and hiding MainMenu
	$GameTileMap.show()
	$Player.show()
	$MainMenu.hide()
	
	
	# We unfreeze the player
	unfreeze_player()
	
	# Switching to player's camera
	$Player/Player/PlayerCamera.make_current()
	
	$HUD.show()


# Called when a key has been picked up
func _on_key_picked_up(x, y):
	number_of_keys += 1


# Called when the create_enigma_popup signal has been emitted
func _on_first_room_door_create_enigma_popup(a : int, b : int, c : int, door : Door):
	# Verifying if a popup has not been created
	if not is_popup_created:
		# Generating the first enigma popup
		var first_enigma = enigma_popup.instantiate()
		first_enigma.load(number_of_keys,a,b,c)
		#first_enigma.position = $Player.position
		add_child(first_enigma)
		first_enigma.show()
		
		# Connecting popup_destroyed signal to the appropriate function
		first_enigma.popup_destroyed.connect(_on_popup_destroyed) 
		# Making door open if enigma is solved
		first_enigma.enigma_solved.connect(door.open)

		# Hiding main node's elements
		#$GameTileMap.hide()
		#$Player.hide()
		freeze_player()
		
		# Reducing PlayerCamera's zoom
		#$Player/Player/PlayerCamera.zoom = Vector2(2,2)
		
		is_popup_created = true


# Called when the popup_destroyed signal has been emitted
func _on_popup_destroyed():
	
	# Showing main node's elements
	#$GameTileMap.show()
	#$Player.show()
	unfreeze_player()
	
	# Returning to PlayerCamera's default zoom
	#$Player/Player/PlayerCamera.zoom = Vector2(DEFAULT_PLAYER_CAMERA_ZOOM,DEFAULT_PLAYER_CAMERA_ZOOM)
	
	is_popup_created = false
