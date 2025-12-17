## Node/Script : Gestionnaire du curseur de sélection dans le menu de combat
## Contrôle la navigation dans les menus et l'exécution des actions de combat
##
## Signaux : Aucun
##
## Variables exportées :
## - button1, button2, button3, button4 : Boutons des options de menu
## - sound_handler : Gestionnaire des effets sonores du menu

extends AnimatedSprite2D

## Position actuelle du curseur (0-3)
var _slot = 0

## Boutons des options de menu
@export var button1: Button
@export var button2: Button
@export var button3: Button
@export var button4: Button
## Gestionnaire des sons du menu
@export var sound_handler: AudioStreamPlayer

@onready var fight: CanvasLayer = get_parent()
@onready var message = get_node("../NinePatchRect2/message_panel")

## Menu actuel affiché
var _current_menu = "main"

# Menus: uniquement Attaque, Défense, Fuite
## Structure des menus disponibles (main, Attaque, Défense, Ennemis)
var _menu_options = [
	["main", "Attaque", "Défense", "Fuite", 1, 2, 3], # 0
	["Attaque"],   # 1: rempli dynamiquement
	["Défense"],   # 2: rempli dynamiquement
	["Ennemis"]    # 3: rempli dynamiquement
]

## Attaque sélectionnée par le joueur
var _selected_attack = null
## Défense sélectionnée par le joueur
var _selected_defense = null
## Action en attente d'exécution ("Attaque" ou "Défense")
var _pending_action = "" # "Attaque" ou "Défense"

# Flag pour empêcher les doubles clics pendant une action bloquante
## Empêche les actions multiples pendant l'exécution d'une action
var _is_action_running := false

## Initialisation du curseur (callback Godot)
func _ready() -> void:
	randomize()
	position.x = 64

## Mise à jour de la position du curseur (callback Godot)
## _delta:float - Temps écoulé depuis la dernière frame
func _process(_delta: float) -> void:
	if not visible:
		return
	position.y = 430 + (43 * _slot)

## Réinitialise le curseur et affiche le menu principal
func initialisation():
	show()
	fight.animation_initialisation()
	position.y = 430
	_current_menu = "main"
	_selected_attack = null
	_selected_defense = null
	_pending_action = ""
	_is_action_running = false
	_menu_input(5) # affiche le menu principal
	_update_description()
	pass
	

## Met à jour les textes des boutons selon le menu actuel
func actualize():
	# Assure 4 lignes pour les sous-menus
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
			# Seulement 3 options: Attaque, Défense, Fuite; le 4e bouton est vide
			button1.text = _menu_options[0][1]
			button2.text = _menu_options[0][2]
			button3.text = _menu_options[0][3]
			button4.text = " "
	_update_description()

## Affiche le menu des attaques disponibles
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

## Affiche le menu des défenses disponibles
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

## Affiche la liste des ennemis ciblables
func _show_ennemies():
	_menu_options[3] = ["Ennemis"]
	for fighter in fight.get_fighters():
		if fighter.get_pv() > 0:
			_menu_options[3].append(fighter.get_fname())
	while _menu_options[3].size() < 5:
		_menu_options[3].append(" ")
	_current_menu = "Ennemis"
	actualize()

## Convertit un nom d'attaque en objet Attack
## aname:String - Nom de l'attaque
## Retourne:Attack - Objet attaque correspondant ou null
func _resolve_attack_name_to_object(aname):
	if not fight.get_player() or not fight.get_player().has_method("get_attacks"):
		return null
	for attack in fight.get_player().get_attacks():
		if attack and attack.has_method("get_aname") and attack.get_aname() == aname:
			return attack
	return null

## Convertit un nom de défense en objet Attack
## dname:String - Nom de la défense
## Retourne:Attack - Objet défense correspondant ou null
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

# Met à jour le panneau de description selon le menu et le slot courant
## Met à jour le texte de description de l'option sélectionnée
func _update_description():
	if not message:
		return
	var txt := ""
	match _current_menu:
		"main":
			# Mapper les 3 boutons visibles
			var label = ["Attaque", "Défense", "Fuite"][min(_slot, 2)]
			match label:
				"Attaque":
					txt = "Choix de l'attaque"
				"Défense":
					txt = "Choix de la défense"
				"Fuite":
					txt = "Tenter de fuir le combat"
		"Attaque":
			var aname = _menu_options[1][1 + _slot]
			if aname != " ":
				var atk = _resolve_attack_name_to_object(aname)
				if atk and atk.has_method("get_description"):
					txt = atk.get_description()
				else:
					txt = "Attaque: " + aname
			else:
				txt = "Choix de l'attaque"
		"Défense":
			var aname = _menu_options[2][1 + _slot]
			if aname != " ":
				var def = _resolve_defense_name_to_object(aname)
				if def and def.has_method("get_description"):
					txt = def.get_description()
				else:
					txt = "Défense: " + aname
			else:
				txt = "Choix de la défense"
		"Ennemis":
			var aname = _menu_options[3][1 + _slot]
			if aname != " ":
				var enemy = null
				for f in fight.get_fighters():
					if f.get_fname() == aname:
						enemy = f
						break
				if enemy and enemy.has_method("get_description"):
					txt = enemy.get_description()
				else:
					txt = "Cible: " + aname
			else:
				txt = "Choix de la cible"
		_:
			txt = ""
	if txt == "":
		message.hide_description()
	else:
		message.show_description(txt)

## Gère les entrées clavier et souris (callback Godot)
## event:InputEvent - Événement d'entrée
func _input(event: InputEvent) -> void:
	if not visible:
		return

	# Bloque toute interaction pendant une action bloquante en cours
	if _is_action_running:
		return

	# Navigation uniquement au tour du joueur
	if not fight.is_player_turn():
		return

	if event.is_action_pressed("cancel"):
		sound_handler.play_cancel()
		_menu_input(5)
		_update_description()

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
		_update_description()
	if event.is_action_pressed("down"):
		sound_handler.play_switch()
		if _slot < 3:
			_slot += 1
		else:
			_slot = 0
		_update_description()

## Gère la navigation et les actions dans les menus
## slot:int - Position du menu (1-4 pour les boutons, 5 pour retour au menu principal)
func _menu_input(slot) -> void:
	if not visible:
		return
	if not fight.get_pause():
		return
	if not fight.is_player_turn():
		return
	# Bloque la navigation pendant une action bloquante
	if _is_action_running:
		return

	if fight._continue():
		var i = 0
		if slot == 5:
			_current_menu = "main"
			button1.text = _menu_options[0][1] # Attaque
			button2.text = _menu_options[0][2] # Défense
			button3.text = _menu_options[0][3] # Fuite
			button4.text = " "
			_update_description()
		else:

			while (_current_menu != _menu_options[i][0] and i < _menu_options.size()):
				i += 1
			if i >= _menu_options.size():
				_current_menu = "main"
				actualize()
				return

			if i == 0:
				# Menu principal
				# Fuite sur le bouton 3 désormais
				if slot == 3:
					fight.end_fight(null)
				else:
					var chosen = _menu_options[0][slot] # 1=Attaque, 2=Défense
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
					_update_description()
			elif i == 1:
				# Sélection d'une attaque
				var chosen_attack_name = _menu_options[i][slot]
				if chosen_attack_name == " ":
					return
				_selected_attack = _resolve_attack_name_to_object(chosen_attack_name)
				_show_ennemies()
				_update_description()
			elif i == 2:
				# Sélection d'une défense (appliquée directement sur le joueur)
				var chosen_defense_name = _menu_options[i][slot]
				if chosen_defense_name == " ":
					return
				_selected_defense = _resolve_defense_name_to_object(chosen_defense_name)
				_update_description()
				if _pending_action == "Défense" and _selected_defense != null:
					# Empêcher double clics jusqu'à la fin de l'action
					_is_action_running = true
					message.hide_description()
					await fight.do_action(fight.get_player().get_fname(), "Défense", _selected_defense)
					_is_action_running = false
					# Revenir au menu principal après l'action
					_current_menu = "main"
					_menu_input(5)
				if fight._continue():
					await fight.end_player_turn()
			elif i == 3:
				# Choix de l'ennemi et exécution (Attaque)
				var enemy_name = _menu_options[i][slot]
				if enemy_name == " ":
					return
				_update_description()
				if _pending_action == "Attaque" and _selected_attack != null:
					# Empêcher double clics jusqu'à la fin de l'action
					_is_action_running = true
					message.hide_description()
					await fight.do_action(enemy_name, "Attaque", _selected_attack)
					_is_action_running = false
					# Revenir au menu principal après l'action
					_current_menu = "main"
					_menu_input(5)
				if fight._continue():
					await fight.end_player_turn()
	else:
		fight.end_fight(fight.is_win())
	pass


func _on_menu_option_1_mouse_entered() -> void:
	if _is_action_running:
		return
	sound_handler.play_switch()
	_slot = 0
	_update_description()

func _on_menu_option_2_mouse_entered() -> void:
	if _is_action_running:
		return
	sound_handler.play_switch()
	_slot = 1
	_update_description()

func _on_menu_option_3_mouse_entered() -> void:
	if _is_action_running:
		return
	sound_handler.play_switch()
	_slot = 2
	_update_description()

func _on_menu_option_4_mouse_entered() -> void:
	if _is_action_running:
		return
	sound_handler.play_switch()
	_slot = 3
	_update_description()

func _on_menu_option_1_pressed() -> void:
	_menu_input(1)

func _on_menu_option_2_pressed() -> void:
	_menu_input(2)

func _on_menu_option_3_pressed() -> void:
	_menu_input(3)

func _on_menu_option_4_pressed() -> void:
	_menu_input(4)
