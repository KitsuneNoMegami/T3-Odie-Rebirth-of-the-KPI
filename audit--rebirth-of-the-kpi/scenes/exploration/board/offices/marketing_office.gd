## Node/Script : Bureau du pôle Marketing
## Configure le système de combat pour le pôle Marketing
##
## Signaux : Aucun

class_name Marketing_office extends TileMapLayer

## Référence à la scène de combat
@onready var fight_scene : CanvasLayer = $fight

## Initialisation du bureau Marketing (callback Godot)
func _ready() -> void:
	GameState.set_fight(fight_scene)
	DialogueManager.set_dialogue_manager(load("res://dialogue/texte/Marketing.dialogue"))