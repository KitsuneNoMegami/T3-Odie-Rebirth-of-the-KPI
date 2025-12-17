## Node/Script : Classe de base pour les PNJ (Personnages Non-Joueurs)
## Contrôle l'apparence et le comportement de base des PNJ
##
## Signaux : Aucun

class_name PNJ
extends  StaticBody2D

@onready var sprite = $pnj_sprite

## Initialisation du PNJ (callback Godot)
func _ready():
	sprite.play("idle")

## Mise à jour du PNJ (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(_delta: float) -> void:
	pass
