extends PanelContainer

class_name CommandBubble

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

## ----- SETTERS ----- ##
func setCommand(command):
	$CommandLabel.text = String(command)

## TODO : Make a setter for position
