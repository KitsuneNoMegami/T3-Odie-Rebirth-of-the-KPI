extends Node2D
var _nom;
var _description;
var _nombre;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _init(nom):
	_nom=nom;
	match _nom :
		"tasse" : 
			_description="Salut moi c'est café ! Un coup de mou pendnat votre audit ? Consommez moi pour récupérer 10 points de vie"
			_nombre=10;
		"goodies" :
			_description="Hey je suis un goodies ! Besoin de plus de vie pendant ton audit ? Je peux t'offrir 5 points de vie maximum supplémentaires"
			_nombre=5;
		_:
			_description="objet mal initialisé il exite pas vraiment"
			
			
#/////////////////////////////////////////////////////////////
#fonction a mettre dans le joueur car elles le concerne 
var consommable=[]

func ajouter_un_objet(objet)->void:
	consommable.append(objet);


func _boire_cafe()->String:
	for object in consommable :
		if object.nom=="tasse":
			#_pv=_pv+object.nombre;
			return "objet consommé";
	return "pas de tasse à consommer";
		
func _accrocher_goodies()->String:
	for object in consommable :
		if object.nom=="goodies":
		#	_pv_max=_pv_max+object.nombre;
			return "objet équipé";
	return "pas de goodies à équiper";
