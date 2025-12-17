## Node/Script : Gestionnaire principal du système de combat
## Contrôle l'interface de combat, les tours de jeu, et les interactions entre joueur et ennemis
##
## Signaux : Aucun
##
## Variables principales :
## - _pause : Indique si le combat est actif
## - _fighters : Liste des ennemis dans le combat
## - _player : Référence au joueur
## - _turn : Tour actuel ("player" ou "enemy")
class_name Fight
extends CanvasLayer

## Indique si le combat est actif (met le jeu en pause)
var _pause = false

## Liste des combattants ennemis
var _fighters
## Référence au joueur
var _player

# Gestion du tour: "player" ou "enemy"
## Tour actuel dans le combat
var _turn := "player"

@onready var fighters_script
## Référence au panneau de messages
@onready var message = get_node("NinePatchRect2/message_panel")
## Référence au curseur de sélection
@onready var cursor: AnimatedSprite2D = $AnimatedSprite2D

## Initialisation du système de combat (callback Godot)
func _ready() -> void:
	randomize()

## Retourne la liste des combattants ennemis
func get_fighters():
	return _fighters

## Retourne la référence au joueur
func get_player():
	return _player

## Vérifie si c'est le tour du joueur
func is_player_turn() -> bool:
	return _turn == "player"

## Termine le combat et retourne à l'exploration
func end_fight():
	GameState.change_state_pole(GameState.get_pole())
	return

## Active ou désactive le mode combat
## path:String - Chemin vers le script des ennemis
## pole:String - Pôle du combat (détermine les ennemis)
## player:Fighter - Instance du joueur
func fight_unfight(path,pole, player):
	_pause = !_pause
	_player = player
	if _pause:
		# Prépare les ennemis
		fighters_script = load(path)
		var _fighters_object = fighters_script.new()
		_fighters = _fighters_object.get_fighters(pole)

		# Affiche l’UI et le curseur
		show()
		cursor.show()
		cursor.initialisation()

		# Démarre au tour du joueur
		_turn = "player"

		get_tree().paused = true
	else:
		hide()
		cursor.hide()
		get_tree().paused = false

## Exécute une attaque sur une cible
## target:Fighter - Cible de l'attaque
## _attack:Attack - Compétence d'attaque à utiliser
## Retourne:bool - true si la cible est morte, false sinon
func attack(target, _attack):
	if target == null:
		return false
	if target.get_pv() <= 0:
		await message.show_message_blocking(target.get_fname() + " est mort")
		return false
	# Récupération nom/dégâts
	var aname := _attack_name(_attack)
	var dmg := _attack_damage(_attack)
	# Appliquer la défense avant les dégâts
	var reduced = target.del_defense(dmg)
	if reduced <= 0:
		await message.show_message_blocking(target.get_fname() + " se défend et ne prend aucun dégat")
		return false
	# Séquence BLOQUANTE d'attaque
	await message.show_message_blocking(aname + " est lancé sur " + target.get_fname() + " et lui inflige " + str(reduced) + " dégats")
	target.delete_pv(reduced)
	if target.get_pv() <= 0:
		await message.show_message_blocking(target.get_fname() + " est mort")
		return true
	return false

## Applique une défense sur une cible
## target:Fighter - Combattant qui se défend
## _defense:Attack - Compétence de défense à utiliser
## Retourne:bool - true si la cible est morte, false sinon
func defenses(target, _defense):
	var dname := _attack_name(_defense)
	var pts_defense := _attack_damage(_defense)
	# Message BLOQUANT de défense
	await message.show_message_blocking(target.get_fname() + " se protège avec " + dname + " de " + str(pts_defense) + " dégats")
	target.add_pts_defense(pts_defense)
	if target.get_pv() <= 0:
		await message.show_message_blocking(target.get_fname() + " est mort")
		return true
	return false

## Recherche un ennemi par son nom
## name_fighter:String - Nom du combattant à trouver
## Retourne:Fighter - Le combattant trouvé ou null
func _find_fighter(name_fighter):
	for fighter in _fighters:
		if fighter.get_fname() == name_fighter:
			return fighter
	return null

# Tour de l'ennemi: attaque aléatoire sur le joueur
## Exécute automatiquement l'attaque d'un ennemi aléatoire vivant
func enemy_auto_reply() -> void:
	var idx := _random_alive_fighter_index()
	if idx == -1:
		return
	var enemy = _fighters[idx]
	await message.show_message_blocking(enemy.get_fname() + " lance une attaque")
	var enemy_attack = null
	if enemy.has_method("get_attacks"):
		var e_attacks = enemy.get_attacks()
		if e_attacks.size() > 0:
			enemy_attack = e_attacks[randi() % e_attacks.size()]
	await attack(_player, enemy_attack)

# Fin du tour du joueur -> lance le tour ennemi puis rend la main au joueur
## Termine le tour du joueur et déclenche le tour de l'ennemi
func end_player_turn() -> void:
	if not _continue():
		return
	_turn = "enemy"
	await enemy_auto_reply()
	if _continue():
		del_all_defense()
	_turn = "player"
	if is_instance_valid(cursor):
		cursor._menu_input(5)

# action_menu: "Attaque" ou "Défense"
# action_use: objet d'attaque/défense sélectionné (peut être null)
## Exécute une action (attaque ou défense) pour un combattant
## fname:String - Nom du combattant qui agit
## action_menu:String - Type d'action ("Attaque" ou "Défense")
## action_use:Attack - Compétence à utiliser (null pour une attaque aléatoire)
func do_action(fname, action_menu, action_use = null):
	match action_menu:
		"Attaque":
			if _player == null:
				return
			if fname == _player.get_fname():
				# Tour d'un ennemi
				var idx := _random_alive_fighter_index()
				if idx == -1:
					return
				var enemy = _fighters[idx]
				await message.show_message_blocking(enemy.get_fname() + " lance une attaque")
				var enemy_attack = action_use
				if enemy_attack == null and enemy.has_method("get_attacks"):
					var e_attacks = enemy.get_attacks()
					if e_attacks.size() > 0:
						enemy_attack = e_attacks[randi() % e_attacks.size()]
				await attack(_player, enemy_attack)
				return
			# Attaque du joueur vers l'ennemi
			await message.show_message_blocking(_player.get_fname() + " lance une attaque")
			var target = _find_fighter(fname)
			if await attack(target, action_use):
				_player.add_credibility(20)
				_player.add_skill(20)
				_fighters.erase(target)
		"Défense":
			if _player == null:
				return
			# Défense du joueur
			await defenses(_player, action_use)
		_:
			pass

## Réinitialise tous les points de défense (fin de tour)
func del_all_defense():
	if _player and _player.has_method("del_defense"):
		_player.del_defense()
	# IMPORTANT: nettoyer aussi la défense des ennemis pour éviter l'accumulation
	if _fighters:
		for fighter in _fighters:
			if fighter and fighter.has_method("del_defense"):
				fighter.del_defense()

## Retourne un nombre aléatoire de combattants (legacy, à vérifier usage)
func fighter_number():
	var nb = 0
	for fighter in _fighters:
		nb += 1
	return randi() % nb

## Retourne l'index d'un ennemi vivant aléatoire
## Retourne:int - Index dans le tableau _fighters, ou -1 si aucun ennemi vivant
func _random_alive_fighter_index() -> int:
	if _fighters == null:
		return -1
	var alive_indices: Array = []
	for i in range(_fighters.size()):
		if _fighters[i].get_pv() > 0:
			alive_indices.append(i)
	if alive_indices.size() == 0:
		return -1
	return alive_indices[randi() % alive_indices.size()]

## Retourne l'état de pause (combat actif ou non)
func get_pause():
	return _pause

## Vérifie si le combat peut continuer (joueur et ennemis encore en vie)
func _continue():
	if not _pause:
		return false
	if _player == null or _fighters == null:
		return true
	if _player.get_pv() <= 0:
		return false
	for fighter in _fighters:
		if fighter.get_pv() > 0:
			return true
	return false

## Vérifie si le joueur a gagné le combat
func is_win():
	return _player != null and _player.get_pv() > 0

## Retourne le nom d'une attaque
## a:Attack - Objet attaque
## Retourne:String - Nom de l'attaque
func _attack_name(a) -> String:
	return a.get_aname()

## Retourne les dégâts d'une attaque
## a:Attack - Objet attaque
## Retourne:int - Points de dégâts
func _attack_damage(a) -> int:
	return a.get_damage()
