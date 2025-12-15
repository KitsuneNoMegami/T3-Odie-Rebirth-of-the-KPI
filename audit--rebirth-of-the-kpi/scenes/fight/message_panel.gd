extends Panel

# Message BLOQUANT (attend une action de l'utilisateur avant de continuer)
# Equivalent de l'ancien show_message
func show_message_blocking(text: String) -> void:
	get_parent().show()
	get_parent().get_parent().get_node("NinePatchRect").hide()
	get_parent().get_parent().get_node("Cursor").hide()
	change_size(1000,70,422)
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
	get_parent().get_parent().get_node("NinePatchRect").show()
	get_parent().get_parent().get_node("Cursor").show()
	change_size(490,523,426)
	

func change_size(_size,x,y):
	get_parent().size.x=_size
	size.x=_size
	get_node("Label").size.x=_size
	get_parent().position.x=x
	position.x=x
	get_node("Label").position.x=x+5
	get_parent().position.y=y
	position.y=y
	get_node("Label").position.y=y+14
	
	
	
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
