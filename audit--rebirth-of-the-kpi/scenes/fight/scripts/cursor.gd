extends AnimatedSprite2D

var _slot = 0
@export var button1: Button
@export var button2: Button
@export var button3: Button
@export var button4: Button
@export var sound_handler: AudioStreamPlayer

@onready var fight: CanvasLayer = get_parent()
@onready var message = get_node("../NinePatchRect2/message_panel")

var _current_menu = "main"

var _menu_options = [
	["main", "Attaque", "Défense", "Objets", "Fuite", 1, 2, 3, 4], # 0
	["Attaque"],   # 1: rempli dynamiquement
	["Défense"],   # 2: rempli dynamiquement
	["Ennemis"]    # 3: rempli dynamiquement
]

var _selected_attack = null
var _selected_defense = null
var _pending_action = "" # "Attaque" ou "Défense"

func _ready() -> void:
	randomize()
	position.x = 100
	pass
	
func _process(_delta: float) -> void:
	if not visible:
		return
	#position.y = 446 + (43 * _slot)
	position.y = 430 + (43 * _slot)
	pass

func initialisation():
	show()
	position.y = 430
	_current_menu = "main"
	_selected_attack = null
	_selected_defense = null
	_pending_action = ""
	_menu_input(5) # affiche le menu principal

func actualize():
	# Assure 4 lignes
	while _menu_options[1].size() < 5:
		_menu_options[1].append(" ")
	while _menu_options[2].size() < 5:
		_menu_options[2].append(" ")
	while _menu_options[3].size() < 5:
		_menu_options[3].append(" ")

	match _current_menu:
		"Attaque":
			button1.text = _menu_options[1][1]
			button2.text = _menu_options[1][2]
			button3.text = _menu_options[1][3]
			button4.text = _menu_options[1][4]
		"Défense":
			button1.text = _menu_options[2][1]
			button2.text = _menu_options[2][2]
			button3.text = _menu_options[2][3]
			button4.text = _menu_options[2][4]
		"Ennemis":
			button1.text = _menu_options[3][1]
			button2.text = _menu_options[3][2]
			button3.text = _menu_options[3][3]
			button4.text = _menu_options[3][4]
		"main":
			button1.text = _menu_options[0][1]
			button2.text = _menu_options[0][2]
			button3.text = _menu_options[0][3]
			button4.text = _menu_options[0][4]

func _show_attacks():
	_menu_options[1] = ["Attaque"]
	var attacks = []
	if fight.get_player() and fight.get_player().has_method("get_attacks"):
		attacks = fight.get_player().get_attacks()
	for attack in attacks:
		if attack and attack.has_method("get_aname"):
			_menu_options[1].append(attack.get_aname())
		else:
			_menu_options[1].append(str(attack))
	while _menu_options[1].size() < 5:
		_menu_options[1].append(" ")
	_current_menu = "Attaque"
	actualize()

func _show_defenses():
	_menu_options[2] = ["Défense"]
	var defenses = []
	if fight.get_player() and fight.get_player().has_method("get_defenses"):
		defenses = fight.get_player().get_defenses()
	for defense in defenses:
		if defense and defense.has_method("get_aname"):
			_menu_options[2].append(defense.get_aname())
		else:
			_menu_options[2].append(str(defense))
	while _menu_options[2].size() < 5:
		_menu_options[2].append(" ")
	_current_menu = "Défense"
	actualize()

func _show_ennemies():
	_menu_options[3] = ["Ennemis"]
	for fighter in fight.get_fighters():
		if fighter.get_pv() > 0:
			_menu_options[3].append(fighter.get_fname())
	while _menu_options[3].size() < 5:
		_menu_options[3].append(" ")
	_current_menu = "Ennemis"
	actualize()

func _resolve_attack_name_to_object(aname):
	if not fight.get_player() or not fight.get_player().has_method("get_attacks"):
		return null
	for attack in fight.get_player().get_attacks():
		if attack and attack.has_method("get_aname") and attack.get_aname() == aname:
			return attack
	return null

func _resolve_defense_name_to_object(dname):
	if fight.get_player():
		if fight.get_player().has_method("get_defenses"):
			for defense in fight.get_player().get_defenses():
				if defense and defense.has_method("get_aname") and defense.get_aname() == dname:
					return defense
		elif fight.get_player().has_method("get_skills"):
			for skill in fight.get_player().get_skills():
				if skill and skill.has_method("get_aname") and skill.get_aname() == dname:
					return skill
	return null

func _input(event: InputEvent) -> void:
	if not visible:
		return

	# Toujours permettre de fermer le message
	if event.is_action_pressed("accept") and message.get_visible():
		message.close_message()
		return
	if event.is_action_pressed("cancel") and message.get_visible():
		message.close_message()
		return

	# Navigation uniquement au tour du joueur
	if not fight.is_player_turn():
		return

	if event.is_action_pressed("cancel"):
		sound_handler.play_cancel()
		_menu_input(5)

	if event.is_action_pressed("accept"):
		match _slot:
			0:
				_on_menu_option_1_pressed()
			1:
				_on_menu_option_2_pressed()
			2:
				_on_menu_option_3_pressed()
			3:
				_on_menu_option_4_pressed()

	if event.is_action_pressed("up"):
		sound_handler.play_switch()
		if _slot > 0:
			_slot -= 1
		else:
			_slot = 3
	if event.is_action_pressed("down"):
		sound_handler.play_switch()
		if _slot < 3:
			_slot += 1
		else:
			_slot = 0

func _menu_input(slot) -> void:
	if not visible:
		return
	if not fight.get_pause():
		return
	if not fight.is_player_turn():
		return

	if fight._continue():
		var i = 0
		if slot == 5:
			_current_menu = "main"
			button1.text = _menu_options[0][1]
			button2.text = _menu_options[0][2]
			button3.text = _menu_options[0][3]
			button4.text = _menu_options[0][4]
		else:
			while (_current_menu != _menu_options[i][0] and i < _menu_options.size()):
				i += 1
			if i >= _menu_options.size():
				_current_menu = "main"
				actualize()
				return

			if i == 0:
				# Menu principal
				if slot == 4:
					# Fuite
					fight.fight_unfight(null)
				else:
					var chosen = _menu_options[i][slot]
					_current_menu = chosen
					match chosen:
						"Attaque":
							_pending_action = "Attaque"
							_selected_attack = null
							_show_attacks()
						"Défense":
							_pending_action = "Défense"
							_selected_defense = null
							_show_defenses()
						"Objets":
							pass
			elif i == 1:
				# Sélection d'une attaque
				var chosen_attack_name = _menu_options[i][slot]
				if chosen_attack_name == " ":
					return
				_selected_attack = _resolve_attack_name_to_object(chosen_attack_name)
				_show_ennemies()
			elif i == 2:
				# Sélection d'une défense (appliquée directement sur le joueur)
				var chosen_defense_name = _menu_options[i][slot]
				if chosen_defense_name == " ":
					return
				_selected_defense = _resolve_defense_name_to_object(chosen_defense_name)
				if _pending_action == "Défense" and _selected_defense != null:
					await fight.do_action(fight.get_player().get_fname(), "Défense", _selected_defense)
				# Fin du tour du joueur -> tour ennemi, puis retour au menu
				if fight._continue():
					await fight.end_player_turn()
			elif i == 3:
				# Choix de l'ennemi et exécution (Attaque)
				var enemy_name = _menu_options[i][slot]
				if enemy_name == " ":
					return
				if _pending_action == "Attaque" and _selected_attack != null:
					await fight.do_action(enemy_name, "Attaque", _selected_attack)
				# Fin du tour du joueur -> tour ennemi, puis retour au menu
				if fight._continue():
					await fight.end_player_turn()
	else:
		if fight.is_win():
			fight.fight_unfight(null)

func choose_rand_action():
	return ["Attaque", "Défense"][randi() % 2]

func _on_menu_option_1_mouse_entered() -> void:
	sound_handler.play_switch()
	_slot = 0

func _on_menu_option_2_mouse_entered() -> void:
	sound_handler.play_switch()
	_slot = 1

func _on_menu_option_3_mouse_entered() -> void:
	sound_handler.play_switch()
	_slot = 2

func _on_menu_option_4_mouse_entered() -> void:
	sound_handler.play_switch()
	_slot = 3

func _on_menu_option_1_pressed() -> void:
	sound_handler.play_click()
	_menu_input(1)

func _on_menu_option_2_pressed() -> void:
	sound_handler.play_click()
	_menu_input(2)

func _on_menu_option_3_pressed() -> void:
	sound_handler.play_click()
	_menu_input(3)

func _on_menu_option_4_pressed() -> void:
	sound_handler.play_click()
	_menu_input(4)
