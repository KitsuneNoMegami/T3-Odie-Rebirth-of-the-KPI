class_name Fighter extends Node2D

var _name
var _pv
var _pv_max
var _description
var _levelCredibility=0
var _levelSkill=0
var _capacities #liste des attaques
var _attacks

@onready var MainScript = preload("res://scenes/global_scripts/main.gd")
@onready var attack_script = preload("res://scenes/global_scripts/Attack.gd")

func _ready():
	pass
	#var main = MainScript.new()
	#main._ready()

func _init(pv=null,name=null):
	_pv=pv
	_pv_max=pv
	_description="test"
	_name=name
	print("attack_script =", attack_script)
	var attack=Attack.new("Turbo Feur",10)
	_attacks=attack
	#faire liste des attaques
	
func delete_pv(pv):
	print(_name,": j'ai perdu ",str(pv))
	_pv-=pv
	print(_name,": il me reste ",str(_pv),"/",str(_pv_max))
	

func get_fname():
	return _name
	
func get_attacks():
	return _attacks
func get_pv():
	return _pv
	
