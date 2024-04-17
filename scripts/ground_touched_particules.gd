extends CPUParticles2D

@export var particule_timer : Timer
@export var sound_effect : AudioStreamPlayer2D

func _on_player_hit_ground():
	self.emitting = true;
	sound_effect.play(0.0)
	particule_timer.start()
	pass


func _on_particule_timer_timeout():
	self.emitting = false;
	particule_timer.stop()
	pass # Replace with function body.
