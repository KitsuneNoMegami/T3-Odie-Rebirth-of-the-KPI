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

func _init(pv=null,fname=null,attacks=null,defenses=null,description=null):
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
	return add_random_attack()
	
func add_skill(nb):
	_levelSkill+=nb
	var add=add_random_defense()
	return add

func add_pts_defense(nb):
	_pts_defense+=nb
	pass
	
func del_defense(nb=null):
	var dmg = _pts_defense
	if nb!=null:
		_pts_defense-=nb
		dmg=_pts_defense
		if _pts_defense<0:
			_pts_defense=0
	return 0-dmg
	
func add_random_attack():
	var skills
	if _levelCredibility >= 20 :
		_pv_max=75
		
	if _levelCredibility>=30 and _attacks.size()==1:
		#15
		skills=["Cartographie des processus","Analyse de conformité réglementaire","Matrice des risques"]
		pass
		
	if _levelCredibility >= 60 :
		_pv_max=90
		
	if _levelCredibility>=90 and _attacks.size()==2:
		#20
		skills=["Test de conception des contrôles","Test d’efficacité opérationnelle","Échantillonnage des transactions","Analyse des écarts"]
		pass
		
	if _levelCredibility >= 100 :
		_pv_max=120
		
	if _levelCredibility >= 130 :
		_pv_max=150
		
	if _levelCredibility>=140 and _attacks.size()==3:
		#28
		skills=["Traçabilité des opérations","Séparation des tâches","Revue des habilitations","Analyse des contrôles automatisés"]
		pass
	if skills!=null:
		_attacks.append(Attack.new(skills[randi() % skills.size()]))
		return true
	return false
func add_random_defense():
	var defense
	if _levelSkill >= 20 and _defenses.size()==1:
		defense=["Clarification"]
		
	if _levelSkill >= 140 and _defenses.size()==2:
		defense=["Reformulation protectrice"]
		
	if _levelSkill >= 240 and _defenses.size()==3:
		defense=["Cadre de l'entretien"]
	
	if defense!=null:
		_defenses.append(Attack.new(defense[0]))
		return true
	return false
		
func _play():
	if sprite and _name:
		sprite.play(_name)
		
func get_fname()->String:
	return _name
func get_defenses():
	return _defenses
func get_pts_defenses():
	return _pts_defense
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
