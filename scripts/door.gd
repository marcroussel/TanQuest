extends Node2D

class_name Door
@export var key_x:float = 0
@export var key_y:float = 0
var hitbox:RigidBody2D
var animation_node:AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	hitbox = get_node("DoorHitBox")
	animation_node = get_node("DoorSprite")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open():
	hitbox.queue_free()
	animation_node.play()
	pass


func _on_key_picked_up(x, y):
	open()



# Called when a player has reached the DoorPlayerDetectorShape
func _on_player_detected(body_rid, body, body_shape_index, local_shape_index):
	pass

# Called when a player leaves the DoorPlayerDetectorShape
func _on_player_leaving(body_rid, body, body_shape_index, local_shape_index):
	pass
