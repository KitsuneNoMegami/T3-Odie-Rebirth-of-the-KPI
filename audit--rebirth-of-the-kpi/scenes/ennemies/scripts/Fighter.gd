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

func _ready():
	pass

func _init(pv=null,fname=null,attacks=null,defenses=null):
	_pv=pv
	_pv_max=pv
	_description="Ceci est la description du personnage du pole"
	_name=fname
	_attacks=attacks
	_defenses=defenses
	
	
func delete_pv(pv):
	_pv-=pv
	
func add_credibility(nb):
	_levelCredibility+=nb
	pass
func add_skill(nb):
	_levelSkill+=nb
	pass
	
func add_pts_defense(nb):
	_pts_defense+=nb
	
func del_defense(nb=null):
	if nb==null:
		_pts_defense=0
	else:
		_pts_defense-=nb
	return 0-_pts_defense
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

func set_sprite(sprite):
	$sprite.play(sprite)
