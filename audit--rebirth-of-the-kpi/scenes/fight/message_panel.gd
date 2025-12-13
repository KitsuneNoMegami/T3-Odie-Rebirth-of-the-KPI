extends Panel

# Message BLOQUANT (attend une action de l'utilisateur avant de continuer)
# Equivalent de l'ancien show_message
func show_message_blocking(text: String) -> void:
	get_parent().show()
	show()
	await get_tree().create_timer(0.05).timeout
	$Label.text = text
	# Boucle d'attente non bloquante: attend que l'utilisateur appuie sur "accept"
	while true:
		await get_tree().process_frame
		if Input.is_action_just_pressed("accept"):
			break
	get_parent().hide()
	hide()

# Message NON BLOQUANT (affiche et ne bloque pas le jeu, se cache quand on le demande)
func show_message_nonblocking(text: String) -> void:
	get_parent().show()
	show()
	$Label.text = text

# API de description (alias vers le non-bloquant)
func show_description(text: String) -> void:
	show_message_nonblocking(text)

# Cache le panneau (utilisé pour descriptions)
func hide_description() -> void:
	get_parent().hide()
	hide()

# Compatibilité arrière: si du code appelle encore show_message, on redirige vers le bloquant
func show_message(text: String) -> void:
	await show_message_blocking(text)

func close_message() -> void:
	hide()

func get_visible() -> bool:
	return visible
