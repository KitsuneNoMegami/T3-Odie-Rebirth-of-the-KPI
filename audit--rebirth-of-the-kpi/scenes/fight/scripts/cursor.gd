extends AnimatedSprite2D

var _slot = 0;
@export var button1: Button
@export var button2: Button
@export var button3: Button
@export var button4: Button
@export var sound_handler: AudioStreamPlayer

var _fighters
var _player
var _is_win
var _everyone_alive=true

var _current_menu = "main";																# id menu
var _menu_options =[["main", "Attaque" ,"Compétences" ,"Objets","Fuite", 1,2,3,4 ], 	# 0
					["Attaque"],					# 1
					["Compétences","mentir","pression","débunk","sympathiser"],				# 2
					["Objets","café","excel","powerpoint","dossier perdu"],				# 3
					["Fuite"]];															# 4

@onready var fighters_script= load("res://scenes/fight/scripts/creation_fighter.gd")
@onready var player_script= load("res://scenes/fight/scripts/creation_player.gd")
@onready var action_script= preload("res://scenes/global_scripts/Actions.gd")
func _ready() -> void:
	position.x = 750;
	var _fighters_object=fighters_script.new()
	_fighters=_fighters_object.get_fighters()
	
	var _player_object=player_script.new()
	_player=_player_object.get_player()
	
	_show_ennemies()
	pass # Replace with function body.

func _process(_delta: float) -> void:
	position.y = 446+(43*_slot)
	_move();
	pass

func _show_ennemies():
	# On reconstruit la liste des ennemis dans le menu "Attaque"
	_menu_options[1] = ["Attaque"]

	for fighter in _fighters:
		# On n'affiche que les vivants
		if fighter.get_pv() > 0:
			_menu_options[1].append(fighter.get_fname())

	# On complète jusqu’à 4 entrées pour éviter les erreurs d’affichage
	while _menu_options[1].size() < 5:
		_menu_options[1].append(" ")

	# Met à jour les boutons du menu
	button1.text = _menu_options[1][1]
	button2.text = _menu_options[1][2]
	button3.text = _menu_options[1][3]
	button4.text = _menu_options[1][4]
	return
func _find_fighter(name_fighter):
	for fighter in _fighters:
		if fighter.get_fname()==name_fighter:
			return fighter
	return null
	
func _move()->void:
	if Input.is_action_just_pressed("cancel"):
		sound_handler.play_cancel()
		_menu_input(5)
	
	if Input.is_action_just_pressed("accept"):
		match _slot:
			0:
				_on_menu_option_1_pressed();
			1:
				_on_menu_option_2_pressed();
			2:
				_on_menu_option_3_pressed();
			3:
				_on_menu_option_4_pressed();
		
	if Input.is_action_just_pressed("up"):
		sound_handler.play_switch()
		if _slot > 0 :
			_slot -= 1
		else :
			_slot = 3	
	if Input.is_action_just_pressed("down"):
		sound_handler.play_switch()
		if _slot < 3 :
			_slot += 1
		else :
			_slot = 0
	pass

func _menu_input(slot)->void:
	if(_continue()):
		var i = 0
		if slot == 5:
			_current_menu = "main";
			button1.text = _menu_options[0][1];
			button2.text = _menu_options[0][2];
			button3.text = _menu_options[0][3];
			button4.text = _menu_options[0][4];
		else:
			while (_current_menu!=_menu_options[i][0]):
				i += 1
				pass
			if i == 0:
				if slot == 4: 
					print(_menu_options[i][slot])
				else:
					button1.text = _menu_options[_menu_options[i][4+slot]][1];
					button2.text = _menu_options[_menu_options[i][4+slot]][2];
					button3.text = _menu_options[_menu_options[i][4+slot]][3];
					button4.text = _menu_options[_menu_options[i][4+slot]][4];
					_current_menu = _menu_options[i][slot];
					pass
				pass
			if i > 0 && i < 4:
				print(_menu_options[i][slot])
				do_action(_menu_options[i][slot],_current_menu)
				if(_continue()):
					do_action(_player.get_fname(),_current_menu)
				pass
			pass
		pass
	else:
		print(_player.get_fname()," a ",_player.get_pv())
		if(is_win()):
			const exploration_scene=preload("res://scenes/exploration/board/board.tscn")
			get_tree().change_scene_to_packed(exploration_scene)
			pass


func do_action(name,action_menu):
	var action= action_script.new()
	match action_menu:
		"Attaque":
			if name==_player.get_fname():
				var nb_fighter=fighter_number()
				print(_fighters[nb_fighter].get_fname()," lance une attaque")
				action.attack(_player,_fighters[fighter_number()].get_attacks())
				return
			print(_player.get_fname(), " lance une attaque")
			
			if action.attack(_find_fighter(name),_player.get_attacks()):
				_player.add_credibility(10)
				_player.add_skill(10)
				
				_fighters.erase(_find_fighter(name))
				_show_ennemies()
	pass

func fighter_number():
	var nb=0
	for fighter in _fighters:
		nb+=1
	return randi()%nb
	
func _continue():
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


func _on_menu_option_1_mouse_entered() -> void:
	sound_handler.play_switch()
	_slot = 0
	pass # Replace with function body.

func _on_menu_option_2_mouse_entered() -> void:
	sound_handler.play_switch()
	_slot = 1
	pass # Replace with function body.

func _on_menu_option_3_mouse_entered() -> void:
	sound_handler.play_switch()
	_slot = 2
	pass # Replace with function body.

func _on_menu_option_4_mouse_entered() -> void:
	sound_handler.play_switch()
	_slot = 3
	pass # Replace with function body.


func _on_menu_option_1_pressed() -> void:
	sound_handler.play_click()
	_menu_input(1)
	pass # Replace with function body.

func _on_menu_option_2_pressed() -> void:
	sound_handler.play_click()
	_menu_input(2)
	pass # Replace with function body.

func _on_menu_option_3_pressed() -> void:
	sound_handler.play_click()
	_menu_input(3)
	pass # Replace with function body.

func _on_menu_option_4_pressed() -> void:
	sound_handler.play_click()
	_menu_input(4)
	pass # Replace with function body.
