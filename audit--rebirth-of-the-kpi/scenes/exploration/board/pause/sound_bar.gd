## Node/Script : Barre de contrôle du volume
## Contrôle le volume global du jeu via une barre de défilement
##
## Signaux : Aucun

class_name Sound_bar extends HScrollBar

## Initialisation de la barre de volume (callback Godot)
func _ready() -> void:
	# Initialise la position de la barre selon le volume actuel du jeu
	var current_db = AudioServer.get_bus_volume_db(0)
	value = db_to_linear(current_db)  # Convertit dB → valeur linéaire (0 à 1)

	# Connecte le signal quand la valeur change
	connect("value_changed", Callable(self, "_on_value_changed"))

## Callback du changement de valeur de la barre
## new_value:float - Nouvelle valeur (0-1)
func _on_value_changed(new_value: float) -> void:
	# Convertit la valeur (0 → 1) en décibels (-80 → 0)
	var db_value = linear_to_db(new_value)
	AudioServer.set_bus_volume_db(0, db_value)

	# (Optionnel) afficher le volume pour déboguer
	print("Volume réglé à :", round(new_value * 100), "%")
