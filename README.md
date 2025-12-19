 # T3 — Odie : Rebirth of the KPI

Jeu pédagogique sur l'audit interne, développé avec Godot Engine (GDScript). 
Le jeu mêle exploration top-down et combats pédagogiques au tour par tour qui symbolisent la collecte d'informations auprès des services d'une grande entreprise.

## Documentation HTML

📄 Pour convertir la documentation Markdown en HTML, voir [CONVERSION.md](./CONVERSION.md)

 
 ## Cahier des charges

**Le [Cahier des charges](./Cahier%20des%20charges.md) est inspiré de celui du projet T4 de l'année dernière**

## Table des matières
1. [Objectif du projet](#objectif-du-projet)
2. [Aperçu rapide](#aperçu-rapide)
3. [Comment jouer (résumé)](#comment-jouer-résumé)
4. [Indicateurs](#indicateurs)
5. [Objectifs pédagogiques principaux](#objectifs-pédagogiques-principaux)
6. [Scénarios de gameplay (exemples)](#scénarios-de-gameplay-exemples)
7. [Actions disponibles pour le joueur](#actions-disponibles-pour-le-joueur)
8. [Contraintes techniques](#contraintes-techniques)
9. [Crédits](#crédits)

## Objectif du projet
Permettre à des apprenants de comprendre et pratiquer, de façon ludique, les étapes clés d'un audit interne : planification, posture professionnelle, collecte d'informations fiables et synthèse finale dans un rapport.

## Aperçu rapide
- Genre : JRPG pédagogique (exploration + combats tour par tour)
- Moteur : Godot Engine (GDScript majoritaire, scripts C# possibles)
- Public : étudiants en audit, qualité, gestion ou novices intéressés par l'audit interne
- Durée d'une partie : courte (20–40 minutes)

## Comment jouer (résumé)
1. Lancer une partie.
2. Se déplacer sur la carte et atteindre les services à auditer.
3. Interagir avec le chef de service pour lancer un "combat de compétences d'audit".
4. Choisir le membre de l'équipe le plus adapté et sélectionner une compétence.
5. Combattre en tour par tour : gagner donne des points et des informations exploitables ; perdre donne des informations erronées et pénalise le joueur.
6. Retour au bureau pour générer le rapport final : les sections liées aux audits réussis sont lisibles ; celles liées aux échecs sont confuses.

## Indicateurs
- Points de compétence (XP) : permettent de débloquer des compétences d'audit.
- Points de crédibilité : influent sur la difficulté et l'accueil des services suivants.
- PV (points de vie) : de l'équipe et des chefs de service.
- Qualité des informations collectées : affecte la lisibilité des passages du rapport final.
- Écrans : écran d'accueil, carte, combat, inventaire, écran de fin (rapport).

## Objectifs pédagogiques principaux
- Planifier un audit : organiser un ordre de passage logique entre services.
- Adopter une posture professionnelle : comprendre l'impact de la crédibilité sur la coopération.
- Rédiger une synthèse : produire des paragraphes structurés dans le rapport final.

## Scénarios de gameplay (exemples)
- Map composée de 5 services + bureau.
- Combat tour par tour : le joueur choisit compétences qu'il connait; le chef de service répond aléatoirement.
- À la fin, génération automatique du rapport : chaque service possède un paragraphe évalué (fiable / partiellement fiable / erroné).

## Actions disponibles pour le joueur
- Naviguer sur la carte et interagir avec les PNJ.
- Lancer un combat d'audit.
- Choisir le membre de l'équipe et la compétence à utiliser.
- Consulter les statistiques du joueur.
- Finaliser la partie en générant le rapport d'audit.

## Contraintes techniques
- Développement sous contrainte de temps.
- Moteur : Godot Engine.
- Langage principal : GDScript

## Crédits

   Développement
   Jeu créé avec Godot Engine
   © Godot Engine — sous licence MIT
   godotengine.org/license

   Code source
   Sous licence Apache 2.0
   Utilisation, modification et distribution autorisées avec mention du copyright d’origine.

   Graphismes
   Personnages — @ErisEsra (utilisation libre, crédit apprécié)
   Bâtiments — @nyk_nck (attribution requise)
   Sol / textures — KenneyNL (CC0 1.0 Universal)

   Musique
   Compositions par Floraphonic, via Pixabay
   Licence Pixabay Content License (usage libre, attribution recommandée)
   pixabay.com/service/license-summary/