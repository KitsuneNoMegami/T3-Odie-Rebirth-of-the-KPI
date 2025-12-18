## Node/Script : Bureau du pôle RH (Ressources Humaines)
## Configure le système de combat pour le pôle RH
##
## Signaux : Aucun

class_name Rh_office extends TileMapLayer

## Référence à la scène de combat
@onready var fight_scene : CanvasLayer = $fight
@onready var pause : CanvasLayer = $pause
## Initialisation du bureau RH (callback Godot)
func _ready() -> void:
	GameState.set_fight(fight_scene)
	DialogueManager.set_dialogue_manager(load("res://dialogue/texte/Rh.dialogue"))
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("pause"):
		pause.pause_unpause()

## Callback appelé quand le dialogue se termine
func _on_dialogue_ended(_resource: DialogueResource) -> void:
	GameState.set_pause(false)
