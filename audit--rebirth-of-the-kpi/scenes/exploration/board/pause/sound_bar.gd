extends HScrollBar

func _ready() -> void:
	# Initialise la position de la barre selon le volume actuel du jeu
	var current_db = AudioServer.get_bus_volume_db(0)
	value = db_to_linear(current_db)  # Convertit dB → valeur linéaire (0 à 1)

	# Connecte le signal quand la valeur change
	connect("value_changed", Callable(self, "_on_value_changed"))

func _on_value_changed(value: float) -> void:
	# Convertit la valeur (0 → 1) en décibels (-80 → 0)
	var db_value = linear_to_db(value)
	AudioServer.set_bus_volume_db(0, db_value)

	# (Optionnel) afficher le volume pour déboguer
	print("Volume réglé à :", round(value * 100), "%")
