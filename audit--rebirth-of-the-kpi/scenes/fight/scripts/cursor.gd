extends AnimatedSprite2D

var _slot = 0;
@export var button1: Button
@export var button2: Button
@export var button3: Button
@export var button4: Button
@export var sound_handler: AudioStreamPlayer
var _fighters
var _player

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
	
	var _i=1
	for fighter in _fighters:
		_menu_options[1].append(fighter.get_fname())
		_i+=1
	var size=_fighters.size()
	for j in range(4-size):
		_menu_options[1].append(" ")
	pass # Replace with function body.

func _process(_delta: float) -> void:
	position.y = 446+(43*_slot)
	_move();
	pass

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
			if(_current_menu=="Attaque"):
				var action= action_script.new() 
				action.attack(_find_fighter(_menu_options[i][slot]),_player.get_attacks())
			pass
		pass
	pass

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
