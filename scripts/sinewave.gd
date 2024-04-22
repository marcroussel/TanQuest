extends Line2D

class_name SineWave

@export_category("Frequencies")
@export var frequency_a : float = 1
@export var frequency_b : float = 1
@export var frequency_c : float = 1

@export_category("Amplitudes")
@export var amplitude_a : float = 50
@export var amplitude_b : float = 50
@export var amplitude_c : float = 50

@export_category("Other")
@export var number_of_points : int = 280
@export var offset_x : float = 40
@export var offset_y : float = 310
@export var space_between_points : float = 3
@export var scale_line : float = 0.5
@export var speed : float = -0.1

@export_category("Maximum")
@export var maximum_value : float = 175
@export var minimum_value : float = -160

func _process(_delta):
	var time = Time.get_ticks_msec() * speed
	var array := []
	for i in range(number_of_points):
		var sin_value : float
		sin_value = (sin(frequency_a*0.01*((offset_x+float(i)*space_between_points)+time))*amplitude_a+
		sin(frequency_b*0.01*((offset_x+float(i)*space_between_points)+time))*amplitude_b+
		sin(frequency_c*0.01*((offset_x+float(i)*space_between_points)+time))*amplitude_c
		)
		if(sin_value>maximum_value):
			sin_value = maximum_value
		if(sin_value<minimum_value):
			sin_value= minimum_value
		array.append(Vector2((offset_x+float(i)*space_between_points)*scale_line, 
		(offset_y+sin_value)*scale_line))
	points = array
