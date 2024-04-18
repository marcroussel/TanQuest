extends Node2D

class_name Door
@export var key_x:float = 0
@export var key_y:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Fonction déclenchée lorsqu'un body entre dans la zone d'Area2D
func _on_area_2d_body_entered(body):
	
	# Importation du nombre de clés du joueur
	var nbKeys = get_parent().get_parent().number_of_keys
	

# func _on_area_2d_body_exited(body):
	
