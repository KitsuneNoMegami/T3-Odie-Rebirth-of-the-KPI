## Node/Script : Zone de sortie des bureaux
## Détecte la sortie du joueur et retourne à la carte principale
##
## Signaux : Aucun

class_name Office_zone extends Area2D


## Initialisation de la zone (callback Godot)
func _ready() -> void:
	pass # Replace with function body.


## Mise à jour de la zone (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(delta: float) -> void:
	delta=delta


## Détecte la sortie du joueur de la zone (callback Godot)
## body:Node2D - Corps sortant de la zone
func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		var scene_path := "res://scenes/exploration/board/mapMario.tscn"
		# Defer the scene change so it doesn't run during the physics callback
		get_tree().call_deferred("change_scene_to_file", scene_path)