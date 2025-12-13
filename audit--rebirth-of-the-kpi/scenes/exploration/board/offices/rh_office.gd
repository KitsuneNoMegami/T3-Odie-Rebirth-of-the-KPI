## Node/Script : Bureau du pôle RH (Ressources Humaines)
## Configure le système de combat pour le pôle RH
##
## Signaux : Aucun

extends TileMapLayer

## Référence à la scène de combat
@onready var fight_scene : CanvasLayer = $fight

## Initialisation du bureau RH (callback Godot)
func _ready() -> void:
	GameState.set_fight(fight_scene)
	DialogueManager.set_dialogue_manager(load("res://RH.dialogue"))
