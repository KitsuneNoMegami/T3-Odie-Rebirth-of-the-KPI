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
	get_parent().get_parent().get_node("NinePatchRect").hide()
	get_parent().get_parent().get_node("Log").hide()
	get_parent().get_parent().get_node("Cursor").hide()
	change_size(1000,5,485)
	show()
	
	await get_tree().create_timer(0.01).timeout
	$Label.text = text
	# Boucle d'attente non bloquante: attend que l'utilisateur appuie sur "accept"
	while true:
		await get_tree().process_frame
		if Input.is_action_just_pressed("accept"):
			break
	get_parent().hide()
	hide()
	get_parent().get_parent().get_node("NinePatchRect").show()
	get_parent().get_parent().get_node("Cursor").show()
	get_parent().get_parent().get_node("Log").show()
	change_size(340,450,488)
	

func change_size(_size,x,y):
	get_parent().size.x=_size
	size.x=_size
	get_node("Label").size.x=_size
	get_parent().position.x=x
	position.x=x
	get_node("Label").position.x=x+15
	get_parent().position.y=y
	position.y=y
	get_node("Label").position.y=y+25
	
	
	
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
