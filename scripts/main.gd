extends Node

@export var number_of_keys:int = 0
@export var enigma_popup:PackedScene

var is_popup_created = false

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


# Called when the create_enigma_popup signal has been emitted
func _on_first_room_door_create_enigma_popup():
	if not is_popup_created:
		var first_enigma = enigma_popup.instantiate()
		add_child(first_enigma)
		first_enigma.popup_destroyed.connect(_on_popup_destroyed)
		first_enigma.show()
		print("enigma_popup created")
		is_popup_created = true

# Called when the popup_destroyed signal has been emitted
func _on_popup_destroyed():
	is_popup_created = false
	print("is_popup_created = false")
