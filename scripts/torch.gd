extends Node2D

class_name Torch
@export var light_size : float = 1
@export var light_variation_size : float = 0

var light_source : PointLight2D
var animation_timer : AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	light_source = get_node("lightSource")
	animation_timer = get_node("animationTimer")
	light_source.set_texture_scale(light_size)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	light_source.set_texture_scale(light_size + (sin(animation_timer.frame*(PI/2)))*light_variation_size)
	pass
