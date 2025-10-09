 ## Cahier des charges

**Ce cahier des charges est inspiré de celui du projet T4 de l'année dernière**

### Objectifs pédagogiques

Ce projet a pour objectif de permettre au joueur d’acquérir une compréhension claire des notions suivantes :

- **La planification d’un audit**
  Le joueur apprend à organiser méthodiquement l’ordre de passage dans les différents pôles de l’entreprise, afin de garantir l’exhaustivité et la qualité du rapport d’audit final.

#### Objectifs pédagogiques avancés

- **Comprendre l’importance de l’image de l’auditeur au sein d’une entreprise**

Lors d’un audit dans une grande organisation, un nouvel auditeur ne peut pas se permettre de solliciter des informations de manière désordonnée ou auprès de n’importe quel interlocuteur, au risque d’obtenir des données erronées et de compromettre la qualité du rapport final.
Il est donc essentiel de construire une image professionnelle, inspirant confiance et compétence, afin de faciliter les échanges avec les collaborateurs des différents pôles. Cette posture favorise un climat de coopération, permettant d’obtenir des informations fiables et pertinentes pour produire un rapport d’audit de qualité.

#### Références

- Monsieur Romain Boully, responsable du service audit interne de l'Unistra

### Description des fonctionnalités

#### Concept du jeu

Le joueur incarne un **auditeur débutant** au sein d’une grande organisation. Sa mission est de réaliser un audit complet de l’entreprise, tout en gérant sa progression personnelle.

Deux indicateurs majeurs définissent sa progression :

- **Points de compétence** qui lui permetteront dans le futur de débloquer des compétences d'expert audit
- **Points de crédibilité** au sein de l’organisation

##### Objectif principal

Atteindre les meilleurs scores possibles en compétences et en crédibilité, tout en ayant audité l’ensemble des pôles de l’entreprise.

Chaque pôle audité peut :

- **Récompenser** le joueur (gain de points et information claire et précise pour le rapport final) si l’audit est réussi
- **Pénaliser** le joueur (perte de points et information erronées pour le rapport final) si l’audit est échoué

##### Réussir un audit

Un audit est reussi quand le joueur auras battu le chef de service grâce à ses compétences et son équipe

##### Échouer un audit

Un audit est échoué quand l'audit et son équipe perdent leur PV

##### Mécanique d’exploration stratégique

Auditer un pôle permet, selon son état, de révéler des **indices** sur l’état de santé des pôles adjacents.  
Le joueur peut ainsi déduire quelles zones sont critiques… mais devra s’assurer d’avoir accumulé suffisamment de points pour y accéder.  
Ce systèsme fonctionne comme une mécanique de type “boss fight” où il faut monter en niveau pour débloquer certaines zones.

##### Interface

- Un écran de fin de jeu et un écran de début de jeu

---

### Scénarios de gameplay

Voici quelques situations types prévues dans le jeu :

1. **Organisation saine**  
   L’entreprise générée possède un bon état général (santé élevée des pôles). Le joueur peine à faire monter ses stats car les récompenses sont faibles. Il termine alors avec peu de compétences et de crédibilité, incarnant un auditeur peu performant.

2. **Organisation en crise**  
   L’entreprise générée est en mauvais état (santé faible partout). Le joueur, incapable d’auditer les pôles sans perdre des points, est contraint de falsifier des rapports. Il finit par être sanctionné ou renvoyé.

> Vous êtes libres d’imaginer d’autres scénarios originaux afin d’enrichir l’expérience de jeu.

---

### Actions du joueur

> **À définir librement par l’équipe de développement.**

Cependant, voici des idées que nous pouvons vous fournir :

- Déplacement (dans un jeu en 3D ou 2D)
- Intéraction avec des PNJ/objets

---

### Contraintes de développement

> **À définir librement par l’équipe de développement.**

Cependant, si vous souhaitez poursuivre notre projet, il est fait en Web avec React et Typescript.

---

### Fonctionnalités et scénarios avancés

**Fonctionnalités prévues :**

- **Compétence spéciale “Pré-audit”** : permet au joueur de connaître à l’avance la santé d’un pôle
- **Système de difficulté** : plusieurs niveaux (Facile, Moyen, Difficile)
- **Interface de statistiques** : affichage des points de compétence et de crédibilité à l’aide de jauges visuelles
- Possibilité de choix du nombre de service à la génération de l'entreprise dans laquelle nous allons opérer