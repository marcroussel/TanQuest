extends Node

const DEFAULT_PLAYER_POSITION_X = 290
const DEFAULT_PLAYER_POSITION_Y = 304

@export var number_of_keys:int = 0
@export var enigma_popup:PackedScene
var main_menu:MainMenu
var game_tile_map:TileMap

var is_popup_created = false

# Called at the begining of the whole program
func _ready():
	# Importing every node needed
	main_menu = get_node("MainMenu")
	game_tile_map = get_node("GameTileMap")
	
	# Hiding player and GameTile and showing MainMenu
	game_tile_map.hide()
	$Player.hide()
	main_menu.show()
	
	# We freeze the player
	$Player/Player.freezed = true
	
	# Switching to main_menu_camera
	main_menu.main_menu_camera.make_current()
	
	# Connecting the start_game signal to start_game function
	main_menu.start_game.connect(start_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Used to set the player at the default begin position
func set_default_player_position():
	$Player.position = Vector2(DEFAULT_PLAYER_POSITION_X, DEFAULT_PLAYER_POSITION_Y)

## ---------- EVENT PROCEDURES ---------- ##

# Called when the game starts, when the start_game signal has
# been emited by the start button
func start_game():
	
	# Setting the default player's position
	set_default_player_position()
	
	# Showing player and GameTile and hiding MainMenu
	game_tile_map.show()
	$Player.show()
	main_menu.hide()
	
	# We unfreeze the player
	$Player/Player.freezed = false
	
	# Switching to player's camera
	$Player/Player/PlayerCamera.make_current()


# Called when a key has been picked up
func _on_key_picked_up(x, y):
	number_of_keys += 1


# Called when the create_enigma_popup signal has been emitted
func _on_first_room_door_create_enigma_popup():
	# Verifying if a popup has not been created
	if not is_popup_created:
		
		# Generating the first enigma popup
		var first_enigma = enigma_popup.instantiate()
		add_child(first_enigma)
		first_enigma.show()
		
		# Connecting popup_destroyed signal to the appropriate function
		first_enigma.popup_destroyed.connect(_on_popup_destroyed) 

		# Hiding main node's elements
		$GameTileMap.hide()
		$Player.hide()
		$Player/Player.freezed = true
		
		is_popup_created = true


# Called when the popup_destroyed signal has been emitted
func _on_popup_destroyed():
	
	# Showing main node's elements
	$GameTileMap.show()
	$Player.show()
	$Player/Player.freezed = false
	
	is_popup_created = false
	
