## Node/Script : Bureau du pôle Commercial
## Configure le système de combat pour le pôle Commercial
##
## Signaux : Aucun

class_name Commercial_office extends TileMapLayer

## Référence à la scène de combat
@onready var fight_scene : CanvasLayer = $fight
@onready var pause : CanvasLayer = $pause
## Initialisation du bureau Commercial (callback Godot)
func _ready() -> void:
	GameState.set_fight(fight_scene)
	DialogueManager.set_dialogue_manager(load("res://dialogue/texte/Commercial.dialogue"))
func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("pause"):
		pause.pause_unpause()
