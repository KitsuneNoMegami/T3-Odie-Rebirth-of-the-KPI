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
@onready var cursor: AnimatedSprite2D = $Cursor
@onready var _log: NinePatchRect=$Log

# --- AJOUTS: sauvegarde/restauration du joueur et suivi des ennemis spawnés ---
var _player_original_parent: Node = null
var _player_original_index: int = -1
var _player_original_xform: Transform2D
var _spawned_enemies: Array = []
# ------------------------------------------------------------------------------

## Initialisation du système de combat (callback Godot)
func _ready() -> void:
	_log.clearLog()
	_log.addLog("Début de l'audit, bonne chance à vous !")
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
	
func animation_initialisation():
	var fighter_node = get_node_or_null("Fighter")
	fighter_node._play()
	fighter_node.set_positions(100,250)
	fighter_node.set_size(10)

	var i=2
	for fighter in _fighters:
		var enemy_node = get_node_or_null("Fighter"+str(i))
		enemy_node._play()
		enemy_node.set_positions(i*150+300,150)
		enemy_node.set_size(2)
		i+=1
	return

## Termine le combat et retourne à l'exploration
func end_fight(win):
	if win!=null:
		if(win):
			GameState.change_state_pole(GameState.get_pole(),true)
			print("gagné")
		else:
			GameState.change_state_pole(GameState.get_pole(),false)
			_player.add_credibility(-10)
			_player.add_skill(-20)
			print("perdu")
	del_all_defense()
	fight_unfight(null, null,null)
	return

## Active ou désactive le mode combat
## path:String - Chemin vers le script des ennemis
## pole:String - Pôle du combat (détermine les ennemis)
## player:Fighter - Instance du joueur
func fight_unfight(path,pole, player):
	_pause = !_pause
	if _pause:
		_player = player
		_player.refill_pv()
		# Prépare les ennemis
		fighters_script = load(path)
		var _fighters_object = fighters_script.new()
		_fighters = _fighters_object.get_fighters(pole,player.get_skill(),player.get_credibility())

		# --- AJOUT: préparer le reparenting propre du joueur ---
		_player_original_parent = null
		_player_original_index = -1
		if _player:
			_player_original_parent = _player.get_parent()
			if _player_original_parent:
				_player_original_index = _player.get_index()
				_player_original_xform = _player.global_transform
				_player_original_parent.remove_child(_player)
		# ------------------------------------------------------

		# Replace Fighter placeholder node with actual player instance
		var old_fighter_node = get_node_or_null("Fighter")
		if old_fighter_node:
			old_fighter_node.queue_free()
		if _player:
			_player.name = "Fighter"
			add_child(_player)

		# Replace Fighter2, Fighter3, Fighter4 placeholder nodes with actual enemy instances
		_spawned_enemies.clear() # --- AJOUT: on suit ce qu'on spawne pour cleanup ---
		var i = 2
		for fighter in _fighters:
			var old_enemy_node = get_node_or_null("Fighter" + str(i))
			if old_enemy_node:
				old_enemy_node.queue_free()
			if fighter:
				fighter.name = "Fighter" + str(i)
				add_child(fighter)
				_spawned_enemies.append(fighter) # --- AJOUT ---
			i += 1

		# Affiche l’UI et le curseur
		cursor.initialisation()
		show()
		cursor.show()

		# Démarre au tour du joueur
		_turn = "player"

		get_tree().paused = true
	else:
		# --- AJOUT: restauration à la sortie du combat ---
		# 1) Supprimer les ennemis instanciés pour le combat
		for e in _spawned_enemies:
			if is_instance_valid(e):
				e.queue_free()
		_spawned_enemies.clear()

		# 2) Rapatrier le joueur chez son parent d'origine et restaurer son transform
		if _player and is_instance_valid(_player):
			# Le joueur est actuellement enfant de cette scène (fight)
			if _player.get_parent() == self:
				remove_child(_player)
			if _player_original_parent and is_instance_valid(_player_original_parent):
				_player_original_parent.add_child(_player)
				# Restituer l'ordre d'enfant si on l'a
				if _player_original_index >= 0:
					_player_original_parent.move_child(_player, _player_original_index)
				# Restaurer sa transform (taille/position/rotation)
				_player.global_transform = _player_original_xform
		# -------------------------------------------------
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
	var aname = _attack_name(_attack)
	var dmg = _attack_damage(_attack)
	_log.addLog(aname+" ("+str(dmg)+" dégats)\n")
	if target.get_pts_defenses()>0:
		_log.addLog(target.get_fname()+"("+str(target.get_pv())+"/"+str(target.get_pvmax())+"+"+str(target.get_pts_defenses())+")->(")
	else:
		_log.addLog(target.get_fname()+"("+str(target.get_pv())+"/"+str(target.get_pvmax())+")->(")
	# Appliquer la défense avant les dégâts
	var reduced=0
	reduced = target.del_defense(dmg)
	if reduced <= 0:
		await message.show_message_blocking(target.get_fname() + " se défend et ne prend aucun dégat")
		_log.addLog(str(target.get_pv())+"/"+str(target.get_pvmax())+")")
		return false
	# Séquence BLOQUANTE d'attaque
	if target.get_fname()==_player.get_fname():
		await message.show_message_blocking(aname + " est lancé sur " + target.get_fname() + " et lui inflige " + str(reduced) + " dégats")
	await message.show_message_blocking(aname + " est lancé sur " + target.get_fname() + " et lui inflige " + str(reduced) + " dégats")
	target.delete_pv(reduced)
	if target.get_pts_defenses()>0:
		_log.addLog(str(target.get_pv())+"/"+str(target.get_pvmax())+"+"+str(target.get_pts_defenses())+")\n")
	else:
		_log.addLog(str(target.get_pv())+"/"+str(target.get_pvmax())+")\n")
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
	_log.addLog(dname+"("+str(pts_defense)+")->"+target.get_fname()+"("+str(target.get_pv())+"+"+str(pts_defense)+")\n")
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
	for enemy in _fighters:
		if enemy.get_pv()>0:
			await message.show_message_blocking(enemy.get_fname() + " lance une attaque")
			_log.addLog(enemy.get_fname()+"("+str(enemy.get_pv())+"/"+str(enemy.get_pvmax())+")"+"->")
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
			# Attaque du joueur vers l'ennemi
			await message.show_message_blocking(_player.get_fname() + " lance une attaque")
			var target = _find_fighter(fname)
			_log.addLog(_player.get_fname()+"("+str(_player.get_pv())+"/"+str(_player.get_pvmax())+")"+"->")
			if await attack(target, action_use) and target.get_fname()!="enemy":
				if _player.add_credibility(10):
					await message.show_message_blocking("Vous avez débloqué une nouvelle compétence de défense grâce à votre crédibilité")
				if _player.add_skill(20):
					await message.show_message_blocking("Vous avez débloqué une nouvelle compétence d'attaque grâce à votre niveau de compétence")
				_fighters.erase(target)
			#qui attaqui qui, les degats, les pv
		"Défense":
			if _player == null:
				return
			# Défense du joueur
			await defenses(_player, action_use)
		_:
			pass
	_log.addLog("\n")

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
