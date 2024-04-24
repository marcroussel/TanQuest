extends Node2D

class_name Osciloscope

signal enigma_solved

@export var player : SineWave
@export var target : SineWave
@export var precision : int = 10
@export var difficulty : int = 1

var a_state : int = 0
var b_state : int = 0
var c_state : int = 0

# Called when the node enters the scene tree for the first time.
func load(difficulty,a,b,c,pa = 0,pb = 0, pc = 0):
	self.difficulty = difficulty
	target.amplitude_a = a
	target.amplitude_b = b
	target.amplitude_c = c
	player.amplitude_a = pa
	player.amplitude_b = pb
	player.amplitude_c = pc
	if(a == 0):
		$ButtonsA.visible = false
	elif(difficulty<1):
		$ButtonsA/DeactivateA.visible = true
	if(b == 0):
		$ButtonsB.visible = false
	elif(difficulty<2):
		$ButtonsB/DeactivateB.visible = true
	if(c == 0):
		$ButtonsC.visible = false
	elif(difficulty<3):
		$ButtonsC/DeactivateC.visible = true
	
func _ready():
	$formula_target.text = "%d sin(x) + %d sin(2x) + %d sin(3x)" % [target.amplitude_a,target.amplitude_b,target.amplitude_c]
	pass # Replace with function body.

func enigma_validation() -> bool : #returns true if the enigma is solved, false if not
	if(player.amplitude_a >= target.amplitude_a-precision && player.amplitude_a<=target.amplitude_a+precision):
		if(player.amplitude_b >= target.amplitude_b-precision && player.amplitude_b<=target.amplitude_b+precision):
			if(player.amplitude_c >= target.amplitude_c-precision && player.amplitude_c<=target.amplitude_c+precision):
				return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(difficulty>=1):
		player.amplitude_a += a_state
		if(difficulty>=2):
			player.amplitude_b += b_state
			if(difficulty>=3):
				player.amplitude_c += c_state
	$formula_player.text = "%d sin(x) + %d sin(2x) + %d sin(3x)" % [player.amplitude_a,player.amplitude_b,player.amplitude_c]
	if(enigma_validation()):
		enigma_solved.emit()
		print("Enigma Solved")

func _start_add_a():
	a_state = 1

func _start_remove_a():
	a_state = -1

func _start_add_b():
	b_state = 1

func _start_remove_b():
	b_state = -1

func _start_add_c():
	c_state = 1

func _start_remove_c():
	c_state = -1

func reset_state_a():
	a_state = 0

func reset_state_b():
	b_state = 0

func reset_state_c():
	c_state = 0
