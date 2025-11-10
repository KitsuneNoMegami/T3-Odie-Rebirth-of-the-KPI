extends AudioStreamPlayer

@export var switch: AudioStream


func play_click() -> void: 
	set_stream(switch)
	pitch_scale = 1.2
	play(0);
	pass
	
func play_switch() -> void: 
	set_stream(switch)
	pitch_scale = 1.5
	play(0);
	pass

func play_cancel() -> void: 
	set_stream(switch)
	pitch_scale = 0.8
	play(0);
	pass
