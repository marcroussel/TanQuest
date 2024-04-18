extends Node

@export var number_of_keys:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Fonction permettant de retirer une clé
# et de renvoyer True si une clé a été retirée
# et False sinon
func remove_one_key():
	if number_of_keys > 0:
		number_of_keys -= 1
		return true
	else:
		return false

## ---------- FONCTIONS EVENEMENTIELLES ---------- ##

# Fonction déclenchée lorsqu'une clé a été récupérée
# Incrémentation du nombre de clés
func _on_key_picked_up(x, y):
	number_of_keys += 1
	print("Nombre de clés : ", number_of_keys) # Pour debug
