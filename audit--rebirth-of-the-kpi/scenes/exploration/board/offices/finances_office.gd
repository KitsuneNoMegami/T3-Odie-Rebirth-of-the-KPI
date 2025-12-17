## Node/Script : Bureau du pôle Finances
## Configure le système de combat pour le pôle Finances
##
## Signaux : Aucun

class_name Finances_office extends TileMapLayer

## Référence à la scène de combat
@onready var fight_scene : CanvasLayer = $fight
@onready var pause : CanvasLayer = $pause
## Initialisation du bureau Finances (callback Godot)
func _ready() -> void:
	GameState.set_fight(fight_scene)
	DialogueManager.set_dialogue_manager(load("res://dialogue/texte/Finance.dialogue"))
	
func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("pause"):
		pause.pause_unpause()
