extends Node2D

class_name Door

## ----- ATTRIBUTES ----- ##
@export var key_x:float = 0
@export var key_y:float = 0

@export var a_enigma:int = 0
@export var b_enigma:int = 0
@export var c_enigma:int = 0

var player_detector:Area2D
var hitbox:RigidBody2D
var animation_node:AnimatedSprite2D
var commandLabel:Label
var is_player_detected:bool

signal create_enigma_popup(a : int, b : int, c : int, door:Door) # Signal sent to main to launch a new popup

## ----- METHODS ----- ##
# Called when the node enters the scene tree for the first time.
func _ready():
	player_detector = get_node("DoorPlayerDetector")
	hitbox = get_node("DoorHitBox")
	animation_node = get_node("DoorSprite")
	commandLabel = get_node("CommandLabel")
	commandLabel.hide()
	is_player_detected = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Used to send the signal when the player is detected and the a key is pressed
func _process(delta):
	if Input.is_action_pressed("general_action") and is_player_detected:
		create_enigma_popup.emit(a_enigma,b_enigma,c_enigma,self) # We sent the signal to main to create the enigma popup

# Function opening the door and removing collision shapes and commandLabel
func open():
	player_detector.queue_free()
	hitbox.queue_free()
	commandLabel.queue_free()
	animation_node.play()
	pass

## ---------- EVENT PROCEDURES ---------- ##

# Called when a key has been picked up
func _on_key_picked_up(x, y):
	open()

# Called when a player has reached the DoorPlayerDetectorShape
func _on_player_detected(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		commandLabel.show()
		is_player_detected = true

# Called when a player leaves the DoorPlayerDetectorShape
func _on_player_leaving(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		commandLabel.hide()
		is_player_detected = false

