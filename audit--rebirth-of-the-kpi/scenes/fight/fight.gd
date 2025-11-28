extends CanvasLayer

var _pause=false
var _everyone_alive=true
var _is_win

var _fighters
var _player

@onready var fighters_script
@onready var player_script= load("res://scenes/fight/scripts/creation_player.gd")
@onready var message=get_node("NinePatchRect2/message_panel")


@onready var cursor: AnimatedSprite2D=$AnimatedSprite2D

func _ready() -> void:
	do_nothing()

func do_nothing():
	print("feur")
	return
	
func get_fighters():
	return _fighters
	
func get_player():
	return _player

func fight_unfight(path):
	_pause=!_pause
	if (_pause):
		cursor.initialisation()
		fighters_script=load(path)
		var _fighters_object=fighters_script.new()
		_fighters=_fighters_object.get_fighters()
		var _player_object=player_script.new()
		_player=_player_object.get_player()
		cursor._show_ennemies()
		show()
		get_tree().paused=true
	else:
		hide()
		get_tree().paused=false
	pass

func attack(target,_attack):
	if(target.get_pv()<=0):
		await message.show_message(target.get_fname()+" est mort")
		return false
	else:
		await message.show_message(_attack.get_aname()+ " est lancé sur "+target.get_fname()+" et lui inflige "+str(_attack.get_damage())+" dégats")
		target.delete_pv(_attack.get_damage())
		if(target.get_pv()<=0):
			await message.show_message(target.get_fname()+ " est mort")
			return true
	pass
func _find_fighter(name_fighter):
	for fighter in _fighters:
		if fighter.get_fname()==name_fighter:
			return fighter
	return null
	
func do_action(name,action_menu):
	match action_menu:
		"Attaque":
			if name==_player.get_fname():
				var nb_fighter=fighter_number()
				await message.show_message(_fighters[nb_fighter].get_fname()+" lance une attaque")
				await attack(_player,_fighters[fighter_number()].get_attacks())
				return
			await message.show_message(_player.get_fname()+" lance une attaque")
			
			if await attack(_find_fighter(name),_player.get_attacks()):
				_player.add_credibility(20)
				_player.add_skill(20)
				
				_fighters.erase(_find_fighter(name))
				
	pass

func fighter_number():
	var nb=0
	for fighter in _fighters:
		nb+=1
	return randi()%nb
	
func get_pause():
	return _pause
	
func _continue():
	if _pause:
		if _player.get_pv()<=0:
			return false
		for fighter in _fighters:
			if fighter.get_pv()>0:
				return true
	return false
	
func is_win():
	if _player.get_pv()==0:
		return false
	return true
