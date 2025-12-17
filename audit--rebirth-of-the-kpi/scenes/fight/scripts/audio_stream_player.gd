## Node/Script : Gestionnaire des effets sonores du menu
## Joue différents sons selon les interactions du menu
##
## Signaux : Aucun
##
## Variables exportées :
## - switch:AudioStream - Son utilisé pour les interactions menu

extends AudioStreamPlayer

## Son utilisé pour les interactions du menu
@export var switch: AudioStream


## Joue le son de clic (pitch élevé)
func play_click() -> void: 
	set_stream(switch)
	pitch_scale = 1.2
	play(0);
	pass

## Joue le son de changement de sélection (pitch moyen)
func play_switch() -> void: 
	set_stream(switch)
	pitch_scale = 1.5
	play(0);
	pass

## Joue le son d'annulation (pitch grave)
func play_cancel() -> void: 
	set_stream(switch)
	pitch_scale = 0.8
	play(0);
	pass
