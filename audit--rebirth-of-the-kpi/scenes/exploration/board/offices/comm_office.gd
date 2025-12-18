## Node/Script : Bureau du pôle Communication
## Configure le système de combat pour le pôle Communication
##
## Signaux : Aucun

class_name Comm_office extends TileMapLayer

## Référence à la scène de combat

@onready var pause : CanvasLayer = $pause
@onready var fight_scene : CanvasLayer = $fight

## Initialisation du bureau Communication (callback Godot)
func _ready() -> void:
	GameState.set_fight(fight_scene)
	DialogueManager.set_dialogue_manager(load("res://dialogue/texte/Communication.dialogue"))
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("pause"):
		pause.pause_unpause()

## Callback appelé quand le dialogue se termine
func _on_dialogue_ended(_resource: DialogueResource) -> void:
	GameState.set_pause(false)
