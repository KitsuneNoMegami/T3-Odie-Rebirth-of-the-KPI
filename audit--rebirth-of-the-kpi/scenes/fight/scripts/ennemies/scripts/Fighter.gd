class_name Fighter extends Node2D

var _name
var _pv
var _pv_max
var _description
var _levelCredibility=0
var _levelSkill=0
var _attacks
var _defenses
var _pts_defense =0

@onready var sprite= $sprite

func _ready():
	pass

func _init(pv=null,fname=null,attacks=null,defenses=null,description="Si vous voyez ceci, c'est de la faute de jonathan"):
	_pv=pv
	_pv_max=pv
	_description=description
	_name=fname
	_attacks=attacks
	_defenses=defenses
	

func set_positions(x,y):
	position.x=x
	position.y=y
	
func set_size(size):
	sprite.scale=Vector2(size,size)
	
func delete_pv(pv):
	_pv-=pv
func refill_pv():
	_pv=_pv_max
	
func add_credibility(nb):
	_levelCredibility+=nb
	return add_random_defense()
	
func add_skill(nb):
	_levelSkill+=nb
	return add_random_attack()

func add_pts_defense(nb):
	_pts_defense+=nb
	pass
	
func del_defense(nb=null):
	if nb==null:
		_pts_defense=0
	else:
		_pts_defense-=nb
	return 0-_pts_defense
	
func add_random_attack():
	var skills
	if _levelCredibility > 20 and _attacks.size()==1:
		_pv_max+=25
		skills=["","","",""]
		
	if _levelCredibility > 60 and _attacks.size()==2:
		_pv_max+=15
		skills=["","","",""]
		
	if _levelCredibility > 100 and _attacks.size()==3:
		_pv_max+=30
		skills=["","","",""]
		
	if _levelCredibility > 130 and _levelSkill > 5 and _attacks.size()==3:
		_pv_max+=30
		skills=["","","",""]
	if skills!=null:
		_attacks.append(skills[randi() % 4])
		return true
	return false
func add_random_defense():
	var defense
	if _levelSkill > 5 and _attacks.size()==1:
		defense=["","","",""]
		
	if _levelSkill > 5 and _attacks.size()==2:
		defense=["","","",""]
		
	if _levelSkill > 5 and _attacks.size()==3:
		defense=["","","",""]
	
	if defense!=null:
		_defenses.append(defense[randi() % 4])
		return true
	return false
		
func _play():
	if sprite and _name:
		sprite.play(_name)
		
func get_fname()->String:
	return _name
func get_defenses():
	return _defenses
func get_attacks():
	return _attacks
func get_description():
	return _description
func get_pv():
	return _pv
func get_pvmax():
	return _pv_max
func get_skill():
	return _levelSkill
func get_credibility():
	return _levelCredibility
