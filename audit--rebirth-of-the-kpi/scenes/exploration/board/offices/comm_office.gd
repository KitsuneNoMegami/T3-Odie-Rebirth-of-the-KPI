## Node/Script : Bureau du pôle Communication
## Configure le système de combat pour le pôle Communication
##
## Signaux : Aucun

extends TileMapLayer

## Référence à la scène de combat
@onready var fight_scene : CanvasLayer = $fight

## Initialisation du bureau Communication (callback Godot)
func _ready() -> void:
	GameState.set_fight(fight_scene)
	DialogueManager.set_dialogue_manager(load("res://Communication.dialogue"))
