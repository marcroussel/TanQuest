extends Sprite2D

class_name Door
@export var key_x:float = 0
@export var key_y:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_key_key_picked_up(x, y):
	if(key_x == x && key_y == y):
		
