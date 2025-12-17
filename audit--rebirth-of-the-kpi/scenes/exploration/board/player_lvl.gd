extends Label

@export var gameState: Script

func _ready() -> void:
	text =  "Niveau de crédibilité :\n"+str(GameState.get_player().get_credibility());
	pass # Replace with function body.
