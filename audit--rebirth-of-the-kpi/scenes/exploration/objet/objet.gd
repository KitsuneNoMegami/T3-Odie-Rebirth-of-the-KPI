## Node/Script : Gestion des objets consommables
## Représente les objets que le joueur peut ramasser et utiliser (tasse, goodies)
##
## Signaux : Aucun
##
## Variables principales :
## - _nom : Nom de l'objet
## - _description : Description de l'effet de l'objet
## - _nombre : Valeur numérique de l'effet (PV ou PV max)

extends Node2D

## Nom de l'objet
var _nom;
## Description de l'objet
var _description;
## Valeur de l'effet (points de vie ou PV maximum)
var _nombre;

# Called when the node enters the scene tree for the first time.
## Initialisation de l'objet (callback Godot)
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
## Mise à jour de l'objet (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(delta: float) -> void:
	pass

## Constructeur de l'objet
## nom:String - Nom de l'objet ("tasse" ou "goodies")
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
#fonctions à mettre dans le joueur car elles le concernent
## Liste des objets consommables du joueur (devrait être dans Player)
var consommable=[]

## Ajoute un objet à l'inventaire
## objet:Object - Objet à ajouter
func ajouter_un_objet(objet)->void:
	consommable.append(objet);


## Consomme une tasse de café pour restaurer des PV
## Retourne:String - Message de confirmation ou d'erreur
func _boire_cafe()->String:
	for object in consommable :
		if object.nom=="tasse":
			#_pv=_pv+object.nombre;
			return "objet consommé";
	return "pas de tasse à consommer";

## Équipe un goodies pour augmenter les PV maximum
## Retourne:String - Message de confirmation ou d'erreur
func _accrocher_goodies()->String:
	for object in consommable :
		if object.nom=="goodies":
		#	_pv_max=_pv_max+object.nombre;
			return "objet équipé";
	return "pas de goodies à équiper";
