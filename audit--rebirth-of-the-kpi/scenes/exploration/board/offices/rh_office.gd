extends TileMapLayer

@onready var fight_scene : CanvasLayer = $fight
func _ready() -> void:
	GameState.set_fight(fight_scene)
	DialogueManager.set_dialogue_manager(load("res://RH.dialogue"))
