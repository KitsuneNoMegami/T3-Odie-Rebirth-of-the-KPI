extends Panel

func show_message(message):
	show()
	await get_tree().create_timer(0.05).timeout
	get_parent().show()
	$Label.text = message
	# On attend de façon non bloquante que le joueur appuie sur "accept"
	while true:
		# laisse le moteur rendre une frame et traiter les événements
		await get_tree().process_frame
		if Input.is_action_just_pressed("accept"):
			break
	get_parent().hide()
	hide()
	return
			
func close_message():
	hide()
func get_visible():
	return visible
