extends Node2D

class_name KeyItem

signal key_picked_up(x:float, y:float)

@export var animation_node : AnimatedSprite2D
@export var offset_amount : float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var position : float = animation_node.frame * (PI/2)
	animation_node.position.y = sin(position)* offset_amount
