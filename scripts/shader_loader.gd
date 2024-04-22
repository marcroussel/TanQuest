extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(Input.is_action_just_released("debug_shader_switch")):
		visible = !visible
		pass
