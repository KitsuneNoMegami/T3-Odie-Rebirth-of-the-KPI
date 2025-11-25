extends AnimatedSprite2D

var _slot = 0;
@export var button1: Button
@export var button2: Button
@export var button3: Button
@export var button4: Button
@export var sound_handler: AudioStreamPlayer

@onready var fight: CanvasLayer=get_parent()
@onready var message=get_node("../NinePatchRect2/message_panel")


var _current_menu = "main";																# id menu
var _menu_options =[["main", "Attaque" ,"Compétences" ,"Objets","Fuite", 1,2,3,4 ], 	# 0
					["Attaque"],														# 1
					["Compétences","mentir","pression","débunk","sympathiser"],			# 2
					["Objets","café","excel","powerpoint","dossier perdu"],				# 3
					["Fuite","Oui","Non"]];															# 4

func _ready() -> void:
	position.x = 750;
	pass # Replace with function body.

func _process(_delta: float) -> void:
	if not visible :
		return
	position.y = 446+(43*_slot)
	#_move();
	pass

func initialisation():
	position.y=446
func _show_ennemies():
	# On reconstruit la liste des ennemis dans le menu "Attaque"
	_menu_options[1]=["Attaque"]
	for fighter in fight.get_fighters():
		# On n'affiche que les vivants
		if fighter.get_pv() > 0:
			_menu_options[1].append(fighter.get_fname())

	while _menu_options[1].size() < 5:
		_menu_options[1].append(" ")
	if _current_menu == "Attaque":
		button1.text = _menu_options[1][1]
		button2.text = _menu_options[1][2]
		button3.text = _menu_options[1][3]
		button4.text = _menu_options[1][4]
	_menu_input(5)
	pass

func _input(event: InputEvent) -> void:
	if not visible :
		return
	if event.is_action_pressed("cancel"):
		sound_handler.play_cancel()
		_menu_input(5)
	
	if event.is_action_pressed("accept"):
		if(message.get_visible()):
			message.close_message()
			return
			
		match _slot:
			0:
				_on_menu_option_1_pressed();
			1:
				_on_menu_option_2_pressed();
			2:
				_on_menu_option_3_pressed();
			3:
				_on_menu_option_4_pressed();
		
	if event.is_action_pressed("up"):
		sound_handler.play_switch()
		if _slot > 0 :
			_slot -= 1
		else :
			_slot = 3	
	if event.is_action_pressed("down"):
		sound_handler.play_switch()
		if _slot < 3 :
			_slot += 1
		else :
			_slot = 0
	pass
	
func _move()->void:
	if not visible :
		return
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
	if not visible :
		return
	if(!fight.get_pause()):
		return
	#await get_tree().create_timer(1).timeout
	if(fight._continue()):
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
					fight.fight_unfight(null)
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
				if(_menu_options[i][slot]==" "):
					return
				match(_current_menu):
					"Attaque":
						if(fight._continue()):
							await fight.do_action(_menu_options[i][slot],_current_menu)
						if(fight._continue()):
							await fight.do_action(fight.get_player().get_fname(),_current_menu)
						_show_ennemies()
				pass
			pass
		pass
	else:
		print(fight.get_player().get_fname()," a ",fight.get_player().get_pv())
		if(fight.is_win()):
			fight.fight_unfight(null)
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
