extends Area2D

@export var player : Player
@export var end_popup : CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	player.freeze_player()
	end_popup.visible = true
	pass # Replace with function body.
