 ## Cahier des charges

**Ce cahier des charges est inspiré de celui du projet T4 de l'année dernière**

### Objectifs pédagogiques

Ce projet a pour objectif de permettre au joueur d’acquérir une compréhension claire des notions suivantes :

- **La planification d’un audit**
  Le joueur apprend à organiser méthodiquement l’ordre de passage dans les différents pôles de l’entreprise, afin de garantir l’exhaustivité et la qualité du rapport d’audit final.

#### Objectifs pédagogiques avancés

- **Comprendre l’importance de l’image de l’auditeur au sein d’une entreprise**

   - Lors d’un audit dans une grande organisation, un nouvel auditeur ne peut pas se permettre de solliciter des informations de manière désordonnée ou auprès de n’importe quel interlocuteur, au risque d’obtenir des données erronées et de compromettre la qualité du rapport final.

   - Il est donc essentiel de construire une image professionnelle, inspirant confiance et compétence, afin de faciliter les échanges avec les collaborateurs des différents pôles. 

   - Cette posture favorise un climat de coopération, permettant d’obtenir des informations fiables et pertinentes pour produire un rapport d’audit de qualité.

#### Références

- Monsieur Romain Boully, responsable du service audit interne de l'Unistra
- Madame Vanessa Balthazard, directrice du Centre d'Education Motrice & SESSAD de Flavigny-sur-Moselle (54)

### Description des fonctionnalités

#### Concept du jeux

Le joueur incarne un **auditeur débutant** au sein d’une grande organisation. Il auras à ses cotés une **équipe d'audits débutants**, avec chacun une **spécialité** et des compétences qui leur sont propre.
La récolte d'information se fait par des **combats de compétences d'audit**.
A la manière d'un jeu Pokémon, le joueurs enverra le membre de son équipe le plus adapté combattre le chef du service à auditer.

Sa mission est de réaliser un audit complet de l’entreprise (tous les services), tout en gérant sa progression personnelle.

Deux indicateurs majeurs définissent sa progression :

- **Points de compétence** qui lui permetteront dans le futur de débloquer des compétences d'expert audit
- **Points de crédibilité** au sein de l’organisation qui diminueront les points de vie des futurs services à auditer

##### Objectif principal

Atteindre les meilleurs scores possibles en compétences et en crédibilité, tout en ayant audité l’ensemble des pôles de l’entreprise.

Chaque pôle audité peut :

- **Récompenser** le joueur (gain de points et information claire et précise pour le rapport final) si l’audit est réussi
- **Pénaliser** le joueur (perte de points et information erronées pour le rapport final) si l’audit est échoué

##### Réussir un audit

Un audit est reussi quand le joueur auras battu le chef de service grâce à ses compétences et son équipe

##### Échouer un audit

Un audit est échoué quand l'audit et son équipe perdent tous leur PV

##### Interface

- Un écran de début de partie
- Une map sur laquelle le joueur se déplace de service en service
- Un écran pour les combats
- Un inventaire
- Un écran de fin

---

### Scénarios de gameplay

1. Le joueur arrive sur la map composé de 3 à 5 services et de sn bureau et se déplace sur celle-ci pour atteindre les différentes services
2. Quand il atteint un service, il peut parler au chef de service pour lancer un combat
3. Le joueur choisi quel membre de son équipe va combattre
4. Le combat est un tour par tour: le joueur choisi la compétence pour attaquer, puis le chef de service choisi aussi une attaque de manière aléatoire
5. 
   a. Si le combat est remporter, le joueur gagne de l'exp de compétence et de l'exp de crédibilité, si il a assez de points de compétence, il peut débloquer de nouvelles compétences pour son équipe. De plus, les informations récoltés seront claires et pertinentes pour le rapport final

   b. Si le combat est perdu, le joueur ne gagne rien et les informations pour le rapport final seront mélangé et incompréhensible
6. A la fin, le joueur réalise le rapport final dans son bureau: pour chaque audit reussi, le paragraphe à son sujet est bien rédiger, sinon le paragraphe désordonnée, remplit d'information inutiles et de choses aléatoire

---

### Actions du joueur

 - lancer une partie 
 - se déplacer sur la map
 - intéragir avec les pnj
 - lancer un combat avec les pnj
 - choisir le membre de son équipe qui attaque
 - choisir la compétence à utiliser pour attaquer
 - finir la partie (realiser le rapport final)

---

### Contraintes de développement

- Nous avons une contrainte de temps pour le rendu
- Nous utilisons el logiciel Godot et le language intégré gdscript

---

### Fonctionnalités et scénarios avancés
