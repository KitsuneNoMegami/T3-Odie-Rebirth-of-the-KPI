class_name Fighter extends Node2D

var _name
var _pv
var _pv_max
var _description
var _levelCredibility=0
var _levelSkill=0
var _capacities #liste des attaques
var _attacks

@onready var attack_script = preload("res://scenes/global_scripts/Attack.gd")

func _ready():
	pass

func _init(pv=null,name=null,attack=null):
	_pv=pv
	_pv_max=pv
	_description="test"
	_name=name
	_attacks=attack
	#faire liste des attaques
	
func delete_pv(pv):
	print(_name,": j'ai perdu ",str(pv))
	_pv-=pv
	print(_name,": il me reste ",str(_pv),"/",str(_pv_max))
	
func add_credibility(nb):
	_levelCredibility+=nb
	pass
func add_skill(nb):
	_levelSkill+=nb
	pass
	
func get_fname()->String:
	return _name
	
func get_attacks():
	return _attacks
func get_pv():
	return _pv
