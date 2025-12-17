## Node/Script : Panneau de messages pendant le combat
## Affiche les messages d'action et descriptions en mode bloquant ou non-bloquant
##
## Signaux : Aucun

extends Panel

# Message BLOQUANT (attend une action de l'utilisateur avant de continuer)
# Equivalent de l'ancien show_message
## Affiche un message et attend que le joueur appuie sur "accept"
## text:String - Texte du message à afficher
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
## Affiche un message sans bloquer le jeu
## text:String - Texte du message à afficher
func show_message_nonblocking(text: String) -> void:
	get_parent().show()
	show()
	$Label.text = text

# API de description (alias vers le non-bloquant)
## Affiche une description (alias de show_message_nonblocking)
## text:String - Texte de la description
func show_description(text: String) -> void:
	show_message_nonblocking(text)

# Cache le panneau (utilisé pour descriptions)
## Cache le panneau de description
func hide_description() -> void:
	get_parent().hide()
	hide()

# Compatibilité arrière: si du code appelle encore show_message, on redirige vers le bloquant
## Méthode de compatibilité pour show_message (redirige vers bloquant)
## text:String - Texte du message
func show_message(text: String) -> void:
	await show_message_blocking(text)

## Ferme le message
func close_message() -> void:
	hide()

## Retourne l'état de visibilité du panneau
func get_visible() -> bool:
	return visible