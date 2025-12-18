# Fight

**Path:** `audit--rebirth-of-the-kpi/scenes/fight/fight.gd`

**Extends:** `CanvasLayer`

## Variables

### _pause

Indique si le combat est actif (met le jeu en pause)

```gdscript
var _pause = false
```

### _fighters

Liste des combattants ennemis

```gdscript
var _fighters
```

### _player

Référence au joueur

```gdscript
var _player
```

### nb_kill

```gdscript
var nb_kill=0
```

### _turn

Tour actuel dans le combat

```gdscript
var _turn := "player"
```

### _player_original_parent

```gdscript
var _player_original_parent: Node = null
```

### _player_original_index

```gdscript
var _player_original_index: int = -1
```

### _player_original_xform

```gdscript
var _player_original_xform: Transform2D
```

### _spawned_enemies

```gdscript
var _spawned_enemies: Array = []
```

### fighter_node

```gdscript
var fighter_node = get_node_or_null("Fighter")
```

### i

```gdscript
var i=2
```

### enemy_node

```gdscript
var enemy_node = get_node_or_null("Fighter"+str(i))
```

### _fighters_object

```gdscript
var _fighters_object = fighters_script.new()
```

### old_fighter_node

```gdscript
var old_fighter_node = get_node_or_null("Fighter")
```

### i

```gdscript
var i = 2
```

### old_enemy_node

```gdscript
var old_enemy_node = get_node_or_null("Fighter" + str(i))
```

### aname

```gdscript
var aname = _attack_name(_attack)
```

### dmg

```gdscript
var dmg = _attack_damage(_attack)
```

### reduced

```gdscript
var reduced=0
```

### dname

```gdscript
var dname := _attack_name(_defense)
```

### pts_defense

```gdscript
var pts_defense := _attack_damage(_defense)
```

### enemy_attack

```gdscript
var enemy_attack = null
```

### e_attacks

```gdscript
var e_attacks = enemy.get_attacks()
```

### target

```gdscript
var target = _find_fighter(fname)
```

### nb

```gdscript
var nb = 0
```

### alive_indices

```gdscript
var alive_indices: Array = []
```

## Functions

### _ready()

Initialisation du système de combat (callback Godot)


### get_fighters()

Retourne la liste des combattants ennemis


### get_player()

Retourne la référence au joueur


### is_player_turn()

Vérifie si c'est le tour du joueur


### animation_initialisation()


### end_fight(win)

Termine le combat et retourne à l'exploration


### fight_unfight(path,pole, player)

Active ou désactive le mode combat
path:String - Chemin vers le script des ennemis
pole:String - Pôle du combat (détermine les ennemis)
player:Fighter - Instance du joueur


### attack(target, _attack)

Exécute une attaque sur une cible
target:Fighter - Cible de l'attaque
_attack:Attack - Compétence d'attaque à utiliser
Retourne:bool - true si la cible est morte, false sinon


### defenses(target, _defense)

Applique une défense sur une cible
target:Fighter - Combattant qui se défend
_defense:Attack - Compétence de défense à utiliser
Retourne:bool - true si la cible est morte, false sinon


### _find_fighter(name_fighter)

Recherche un ennemi par son nom
name_fighter:String - Nom du combattant à trouver
Retourne:Fighter - Le combattant trouvé ou null


### enemy_auto_reply()

Exécute automatiquement l'attaque d'un ennemi aléatoire vivant


### end_player_turn()

Termine le tour du joueur et déclenche le tour de l'ennemi


### do_action(fname, action_menu, action_use = null)

Exécute une action (attaque ou défense) pour un combattant
fname:String - Nom du combattant qui agit
action_menu:String - Type d'action ("Attaque" ou "Défense")
action_use:Attack - Compétence à utiliser (null pour une attaque aléatoire)


### del_all_defense()

Réinitialise tous les points de défense (fin de tour)


### fighter_number()

Retourne un nombre aléatoire de combattants (legacy, à vérifier usage)


### _random_alive_fighter_index()

Retourne l'index d'un ennemi vivant aléatoire
Retourne:int - Index dans le tableau _fighters, ou -1 si aucun ennemi vivant


### get_pause()

Retourne l'état de pause (combat actif ou non)


### _continue()

Vérifie si le combat peut continuer (joueur et ennemis encore en vie)


### is_win()

Vérifie si le joueur a gagné le combat


### _attack_name(a)

Retourne le nom d'une attaque
a:Attack - Objet attaque
Retourne:String - Nom de l'attaque


### _attack_damage(a)

Retourne les dégâts d'une attaque
a:Attack - Objet attaque
Retourne:int - Points de dégâts

