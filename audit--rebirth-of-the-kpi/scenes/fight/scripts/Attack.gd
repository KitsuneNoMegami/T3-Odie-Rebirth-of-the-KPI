class_name Attack
extends Node

var _name
var _damage
var _description

func _init(aname = null):
	_name = aname
	match aname:
		#Compétence d'attaques
		"Collecte d'information":
			_damage=2
			_description="Pose une question"
			pass
		"Validation factuelle":
			_damage=5
			_description="Confrontation de données d'autres pôles avec des informations données dans ce pôle"
			pass
		"Analyse comportementale":
			_damage=4
			_description="Analyse de la personne auditée afin de décerner du stress ou du mensonge"
			pass
		"Recadrage de l'entretien":
			_damage=3
			_description="Rappel de l'objectif de l'audit"
			pass
		"Gestion relationnelle":
			_damage=3
			_description="Compliment,phrase d'accorche afin de mettre en confiance la personne auditée"
			pass
			
		#Compétence de défense
		"Reformulation protectrice":
			_damage=5
			_description="Reprend calmement les propos de l'audité pour désamorcer un conflit/éviter de mauvaises interprétations"
			pass
		"Cadre de l'entretien":
			_damage=5
			_description="Rappelle les règles du dialogue (respect,objectif,...)"
			pass
		"Ecoute active":
			_damage=5
			_description="Diminue l'hostilité de l'audité et améliore la qualité des informations"
			pass
		"Clarification":
			_damage=3
			_description="Demande une clarification des informations afin d'éviter le plus d'ambiguïtés possible"
			pass
		"Posture neutre":
			_damage=3
			_description="Résistance à la pression et au stress causé par l'interlocuteur. Mode Suisse activé"
			pass
			
			
	
func get_damage():
	return _damage
	
func get_aname()->String:
	return _name
	
func get_description():
	return _description
		

	
