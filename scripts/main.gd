extends Node

@export var number_of_keys:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Fonction déclenchée lorsqu'une clé a été récupérée
# Incrémentation du nombre de clés
func _on_key_picked_up(x, y):
	number_of_keys += 1
	print("Nombre de clés : ", number_of_keys) # Pour debug

