extends Node2D

class_name KeyItem

signal key_picked_up(x:float, y:float)

@export var animation_node : AnimatedSprite2D
@export var light : PointLight2D
@export var colision_box : Area2D
@export var key_sound : AudioStreamPlayer2D
@export var offset_amount : float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var position : float = animation_node.frame * (PI/2)
	animation_node.position.y = sin(position)* offset_amount



func _on_key_collision_area_entered(area):
	animation_node.play("picked_up")
	key_sound.play(0.0)
	light.queue_free()
	key_picked_up.emit(position.x,position.y)
	print("Key touched %d %d" % [position.x, position.y])
	pass # Replace with function body.1


func _on_key_sprite_animation_finished():
	self.queue_free()
	pass # Replace with function body.
