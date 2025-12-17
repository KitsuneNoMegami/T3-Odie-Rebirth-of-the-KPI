## Node/Script : Bouton du bâtiment Informatique
## Permet d'accéder au bureau du pôle Informatique

class_name  IT_building extends TextureButton


## Initialisation du bouton (callback Godot)
func _ready() -> void:
	pass # Replace with function body.


## Mise à jour du bouton (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(_delta: float) -> void:
	pass

## Gère le clic sur le bouton pour entrer dans le bureau IT (callback Godot)
func _on_pressed() -> void:
	const office_scene=preload("res://scenes/exploration/board/offices/itOffice.tscn")
	get_tree().change_scene_to_packed(office_scene)