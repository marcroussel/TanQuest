extends Line2D

@export_category("Frequencies")
@export var frequency_a : float = 1
@export var frequency_b : float = 1
@export var frequency_c : float = 1

@export_category("Amplitudes")
@export var amplitude_a : float = 50
@export var amplitude_b : float = 50
@export var amplitude_c : float = 50

@export_category("Other")
@export var number_of_points : int = 750
@export var offset_x : float = 0
@export var offset_y : float = 200
@export var space_between_points : float = 3
@export var scale_line : float = 0.5
@export var speed : float = -0.1
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	var time = Time.get_ticks_msec() * speed
	var array := []
	for i in range(number_of_points):
		array.append(Vector2((offset_x+float(i)*space_between_points)*scale_line, 
		(offset_y+
		sin(frequency_a*0.01*((offset_x+float(i)*space_between_points)+time))*amplitude_a+
		sin(frequency_b*0.01*((offset_x+float(i)*space_between_points)+time))*amplitude_b+
		sin(frequency_c*0.01*((offset_x+float(i)*space_between_points)+time))*amplitude_c
		)*scale_line))
	points = array
