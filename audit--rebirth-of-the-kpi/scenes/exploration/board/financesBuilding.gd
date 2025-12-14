## Node/Script : Bouton du bâtiment Finances
## Permet d'accéder au bureau du pôle Finances

class_name  Finances_building extends TextureButton


## Initialisation du bouton (callback Godot)
func _ready() -> void:
	pass

## Mise à jour du bouton (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(_delta: float) -> void:
	pass

## Gère le clic sur le bouton pour entrer dans le bureau Finances (callback Godot)
func _on_pressed() -> void:
	const office_scene = preload("res://scenes/exploration/board/offices/financesOffice.tscn")
	get_tree().change_scene_to_packed(office_scene)