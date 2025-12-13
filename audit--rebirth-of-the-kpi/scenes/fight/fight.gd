extends CanvasLayer

var _pause = false

var _fighters
var _player

# Gestion du tour: "player" ou "enemy"
var _turn := "player"

@onready var fighters_script
@onready var message = get_node("NinePatchRect2/message_panel")
@onready var cursor: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	randomize()

func get_fighters():
	return _fighters

func get_player():
	return _player

func is_player_turn() -> bool:
	return _turn == "player"
	
func end_fight(win):
	if(win):
		GameState.change_state_pole(GameState.get_pole(),true)
	else:
		GameState.change_state_pole(GameState.get_pole(),false)
	fight_unfight(null, null,null)
	return
	
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

func _find_fighter(name_fighter):
	for fighter in _fighters:
		if fighter.get_fname() == name_fighter:
			return fighter
	return null

# Tour de l'ennemi: attaque aléatoire sur le joueur
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
				_player.add_skill(25)
				_fighters.erase(target)
		"Défense":
			if _player == null:
				return
			# Défense du joueur
			await defenses(_player, action_use)
		_:
			pass

func del_all_defense():
	if _player and _player.has_method("del_defense"):
		_player.del_defense()
	# IMPORTANT: nettoyer aussi la défense des ennemis pour éviter l'accumulation
	if _fighters:
		for fighter in _fighters:
			if fighter and fighter.has_method("del_defense"):
				fighter.del_defense()

func fighter_number():
	var nb = 0
	for fighter in _fighters:
		nb += 1
	return randi() % nb

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

func get_pause():
	return _pause

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

func is_win():
	return _player != null and _player.get_pv() > 0

func _attack_name(a) -> String:
	return a.get_aname()

func _attack_damage(a) -> int:
	return a.get_damage()
