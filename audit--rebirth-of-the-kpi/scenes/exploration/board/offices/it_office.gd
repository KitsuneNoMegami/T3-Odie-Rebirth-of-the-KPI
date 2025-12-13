## Node/Script : Bureau du pôle Informatique
## Configure le système de combat pour le pôle IT
##
## Signaux : Aucun

extends TileMapLayer

## Référence à la scène de combat
@onready var fight_scene : CanvasLayer = $fight

## Initialisation du bureau IT (callback Godot)
func _ready() -> void:
	GameState.set_fight(fight_scene)
	DialogueManager.set_dialogue_manager(load("res://Info.dialogue"))
