## Node/Script : Classe Attack représentant une compétence d'attaque ou de défense
## Gère les différentes compétences utilisables pendant les combats d'audit
##
## Signaux : Aucun
##
## Variables principales :
## - _name : Nom de la compétence
## - _damage : Points de dégâts infligés (ou points de défense pour les compétences défensives)
## - _description : Description détaillée de la compétence

class_name Attack
extends Node

## Nom de la compétence
var _name
## Points de dégâts (ou défense) de la compétence
var _damage
## Description détaillée de la compétence
var _description

## Constructeur de l'attaque/défense
## aname:String - Nom de la compétence à créer
func _init(aname = null,buff=1):
	_name = aname
	_damage=0
	match aname:
		#Compétence d'attaques de test
		"Turbo puissance":
			_damage=50
			_description="Attaque pour faire bcp de dégat en mode je suis trop puissant "
		"Turbo fraude":
			_damage=0
			_description="Tu es là, voilà"
			
		#Compétence d'attaques joueur
		"Revue de la documentation existante":
			_damage=10
			_description="Analyse des procédures, politiques et modes opératoires formalisés par l’entité."

		"Entretien":
			_damage=10
			_description="Collecte d’informations par échanges structurés avec les responsables concernés."

		"Cartographie des processus":
			_damage=15
			_description="Identification et représentation des flux opérationnels et décisionnels."

		"Analyse de conformité réglementaire":
			_damage=15
			_description="Vérification de l’alignement des pratiques avec les exigences légales et normatives."

		"Évaluation du contrôle interne":
			_damage=10
			_description="Appréciation de la conception et de l’efficacité des contrôles en place."

		"Identification des risques clés":
			_damage=10
			_description="Recensement des risques susceptibles d’affecter l’atteinte des objectifs."

		"Matrice des risques":
			_damage=15
			_description="Classement des risques selon leur probabilité et leur impact."

		"Test de conception des contrôles":
			_damage=20
			_description="Vérification que les contrôles prévus répondent aux risques identifiés."

		"Test d’efficacité opérationnelle":
			_damage=20
			_description="Vérification que les contrôles fonctionnent réellement dans la pratique."

		"Échantillonnage des transactions":
			_damage=20
			_description="Sélection d’un ensemble représentatif d’opérations à analyser."

		"Revue des justificatifs":
			_damage=15
			_description="Examen des preuves documentaires associées aux opérations testées."

		"Analyse des écarts":
			_damage=20
			_description="Identification des différences entre les procédures définies et les pratiques observées."

		"Traçabilité des opérations":
			_damage=28
			_description="Suivi d’une opération de bout en bout dans les systèmes et documents."

		"Séparation des tâches":
			_damage=28
			_description="Vérification de l’absence de cumul de fonctions incompatibles."

		"Revue des habilitations":
			_damage=28
			_description="Analyse des droits d’accès aux systèmes et applications."

		"Analyse des contrôles automatisés":
			_damage=28
			_description="Évaluation des contrôles intégrés aux outils informatiques."
			
		#Compétence d'attaques ennemies
		"Production tardive des documents":
			_damage=3
			_description="Transmission des éléments demandés après plusieurs relances ou hors délai prévu."

		"Justificatif partiel":
			_damage=3
			_description="Fourniture de documents incomplets ou ne couvrant pas l’ensemble du périmètre demandé."

		"Procédure non formalisée":
			_damage=3
			_description="Existence d’une pratique opérationnelle sans documentation écrite associée."

		"Dépendance à une personne clé":
			_damage=2
			_description="Concentration des connaissances et des décisions sur un seul acteur."

		"Argument de l’usage établi":
			_damage=2
			_description="Justification d’une pratique par son ancienneté plutôt que par une règle formelle."

		"Absence de preuve disponible":
			_damage=4
			_description="Impossibilité de produire un élément attestant de la réalisation d’un contrôle."

		"Contournement du processus":
			_damage=6
			_description="Réalisation d’une opération en dehors du circuit prévu."

		"Validation a posteriori":
			_damage=4
			_description="Approbation réalisée après l’exécution effective de l’opération."

		"Contrôle compensatoire informel":
			_damage=6
			_description="Existence d’un contrôle alternatif non documenté."

		"Méconnaissance de la procédure":
			_damage=6
			_description="Non-maîtrise des règles applicables par les opérationnels."

		"Habilitations excessives":
			_damage=5
			_description="Attribution de droits supérieurs aux besoins réels de la fonction."

		"Absence de traçabilité":
			_damage=5
			_description="Manque d’historique permettant de reconstituer une opération."

		"Données non réconciliées":
			_damage=5
			_description="Écarts entre plusieurs sources sans analyse formalisée."

		"Mise à jour non réalisée":
			_damage=7
			_description="Documentation ou paramétrage non aligné avec la pratique actuelle."

		"Délégation non encadrée":
			_damage=30
			_description="Transfert de responsabilités sans cadre formel défini."

		"Contrôle non systématique":
			_damage=10
			_description="Réalisation irrégulière ou ponctuelle d’un contrôle prévu."

		"Justification orale uniquement":
			_damage=10
			_description="Explication fournie sans support écrit ou preuve matérielle."

		"Priorité opérationnelle invoquée":
			_damage=12
			_description="Non-application d’un contrôle au motif de contraintes de délai ou de charge."

		"Historique non conservé":
			_damage=13
			_description="Suppression ou non-archivage des données nécessaires au suivi."

		"Responsabilité non clairement définie":
			_damage=20
			_description="Flou sur le rôle ou le périmètre d’intervention des acteurs."

		"Dépendance à un outil non maîtrisé":
			_damage=15
			_description="Utilisation d’un système sans compréhension complète de son fonctionnement."

		"Absence de revue hiérarchique":
			_damage=15
			_description="Manque de supervision formalisée des travaux réalisés."

		"Correction manuelle non tracée":
			_damage=15
			_description="Modification de données sans justification documentée."

		"Risque accepté implicitement":
			_damage=40
			_description="Exposition connue mais non formalisée ni validée."

		"Plan d’action non priorisé":
			_damage=30
			_description="Actions identifiées sans échéance ni responsable clair."
		
		"Validation contradictoire":
			_damage=0
			_description="Échange avec l’audité pour confirmer les faits et leur compréhension."

		#Compétence de défense
		"Reformulation protectrice":
			_damage=17
			_description="Reprend calmement les propos de l'audité pour désamorcer un conflit/éviter de mauvaises interprétations"
			pass
		"Cadre de l'entretien":
			_damage=20
			_description="Rappelle les règles du dialogue (respect,objectif,...)"
			pass
		"Ecoute active":
			_damage=5
			_description="Diminue l'hostilité de l'audité et améliore la qualité des informations"
			pass
		"Clarification":
			_damage=14
			_description="Demande une clarification des informations afin d'éviter le plus d'ambiguïtés possible"
			pass
		"Posture neutre":
			_damage=10
			_description="Résistance à la pression et au stress causé par l'interlocuteur. Mode Suisse activé"
			pass
	_damage=_damage*buff

	
## Retourne les points de dégâts de la compétence
func get_damage():
	return _damage

## Retourne le nom de la compétence
func get_aname()->String:
	return _name

## Retourne la description de la compétence
func get_description():
	return _description
