extends Node2D

class_name Door
@export var key_x:float = 0
@export var key_y:float = 0
var player_detector:Area2D
var hitbox:RigidBody2D
var animation_node:AnimatedSprite2D
var commandLabel:Label

# Called when the node enters the scene tree for the first time.
func _ready():
	player_detector = get_node("DoorPlayerDetector")
	hitbox = get_node("DoorHitBox")
	animation_node = get_node("DoorSprite")
	commandLabel = get_node("CommandLabel")
	commandLabel.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
	commandLabel.show()

# Called when a player leaves the DoorPlayerDetectorShape
func _on_player_leaving(body_rid, body, body_shape_index, local_shape_index):
	commandLabel.hide()
