## Node/Script : PNJ du pôle Informatique
## Représente le personnage Wemmert (contact IT) dans le jeu
##
## Signaux : Aucun

extends  StaticBody2D

@onready var sprite = $pnj_sprite

## Initialisation du PNJ IT (callback Godot)
func _ready():
	sprite.play("wemmert")

## Mise à jour du PNJ (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(delta: float) -> void:
	pass
