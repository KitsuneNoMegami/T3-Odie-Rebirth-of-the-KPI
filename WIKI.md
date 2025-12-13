# T3 — Odie : Rebirth of the KPI

Ce document détaille les axes pédagogiques et les choix de conception du jeu afin d'aider les développeurs et les enseignants à comprendre les objectifs, les mécaniques et les retours  pour l'apprenant.

---

## Table des matières
1. [Objectifs pédagogiques](#objectifs-pédagogiques)
2. [Description sommaire du jeu](#description-sommaire-du-jeu)
3. [Actions du joueur — détails et conséquences](#actions-du-joueur--détails-et-conséquences)
4. [Informations et feedback renvoyés au joueur](#informations-et-feedback-renvoyés-au-joueur)
5. [Notes techniques rapides](#notes-techniques-rapides)

---

## Objectifs pédagogiques

But global : permettre à l'apprenant de comprendre les étapes clés d'un audit interne et d'expérimenter les conséquences de ses choix opérationnels et communicationnels.

Objectifs opératoires (sous-ensemble prioritaire) :
- Planifier un audit simple :
  - Savoir identifier un ordre logique de visite des services (indicateur : dans 80 % des scénarios, l'apprenant visite les services dans un ordre couvrant dépendances/flux).
- Recueillir des informations fiables :
  - Savoir choisir la bonne approche (PNJ adéquat / compétence adéquate) pour obtenir une information claire (indicateur : proportion d'audits où la "qualité d'information" est haute).
- Adapter sa posture professionnelle :
  - Comprendre que la présentation et la méthode influencent la coopération (indicateur : relation entre score de crédibilité et facilité des combats suivants).
- Rédiger une synthèse :
  - Produire un paragraphe final structuré et cohérent pour chaque service audité (indicateur : nombre de paragraphes corrects dans le rapport final).

Évaluation en jeu :
- Indicateurs chiffrés (points de compétence, crédibilité).
- Qualité textuelle des paragraphes du rapport (métrique interne : clair / partiellement clair / illisible).

---

## Description sommaire du jeu

- Genre : JRPG pédagogique, exploration top-down + combats au tour par tour.  
- Public cible : étudiants, interessé par le processus d'audit ou encore novices en processus d'entreprise.  
- Durée d'une partie type : 15-20 minutes.  
- Ton : pédagogique sérieux, mais ludique et accessible.  
- Esthétique : 2D top-down, style pixel, assets listés dans les crédits.

Résumé du gameplay : le joueur incarne Odie un auditeur débutant qui doit visiter tous les services d’une entreprise, interagir avec les chefs de service via des "combats d'audit" symbolisant la collecte d'information, puis produire un rapport final dont la qualité dépend des succès rencontrés.

---

## Actions du joueur — détails et conséquences

A. Navigation
- Se déplacer sur la carte entre les services et le bureau.
  - Conséquence : déclenche possibilité d'interaction / combat.

B. Interaction PNJ
- Parler au chef de service pour déclencher l’audit.
  - Conséquence : entrée dans l’écran de "combat d'audit".


C. Choix de compétence (combat)
- Sélectionner une "compétence d'audit"
  - Conséquence : chaque compétence a un effet sur PV, crédibilité, et sur la qualité de l'information obtenue.

D. Rapport final
- Compiler les informations collectées et générer le rapport.
- Conséquence : qualité finale évaluée selon audits réussis/ratés.
---

## Informations et feedback renvoyés au joueur

A. Feedback immédiat (durant le combat)
- Dégâts et Compétence utilisée (ex. "Analyse comportementale", "Collecte d'informationn").
- Informations lors de la défense (ex :"Ecoute active","Reformulation protectrice)
- Action de l'audité ( ex: "Le manager utilise Gestion relationnelle sur l'auditeur")

B. Feedback de progression
- Points de compétence (XP) : barre / niveau.
- Points de crédibilité : jauge influençant la difficulté future.
- Gains/Perte après combat : résumé chiffré.


C. Feedback final — Rapport d'audit
- Le rapport est généré automatiquement et contient :
  - Un paragraphe par pôle/service audité.
  - Un indicateur de lisibilité/cohérence pour chaque paragraphe.
  - Un score final combinant compétences & crédibilité.

---

## Notes techniques rapides 

-- Principale stack : Godot Engine / GDScript.
- Fichiers de configuration de la map, services et compétences à centraliser pour faciliter l'ajout de scénarios pédagogiques.


---

Crédits et licences : voir le [README](./README.md) principal.