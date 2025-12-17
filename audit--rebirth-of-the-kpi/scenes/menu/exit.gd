## Node/Script : Label Exit du menu
## Label simple pour l'option "Exit" du menu
##
## Signaux : Aucun

extends Label


# Called when the node enters the scene tree for the first time.
## Initialisation du label (callback Godot)
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
## Mise à jour du label (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(_delta: float) -> void:
	pass

## Quitte le jeu
func exit() -> void :
	get_tree().quit()