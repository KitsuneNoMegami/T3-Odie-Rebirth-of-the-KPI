# Player

**Path:** `audit--rebirth-of-the-kpi/scenes/exploration/player/player.gd`

**Extends:** `CharacterBody2D`

## Signals

### no_player_in_range

Signal émis lorsque le joueur quitte la zone d'interaction


## Variables

### _speed

Vitesse de déplacement en pixels/seconde

```gdscript
var _speed: int= 250
```

### pnj_in_range

Indique si un PNJ est à portée d'interaction

```gdscript
var pnj_in_range = false # si un pnj est aux alentours
```

### gameState

Script de gestion de l'état global du jeu

```gdscript
@export var gameState: Script
```

### direction

```gdscript
var direction = Input.get_vector("left", "right", "up", "down")
```

## Functions

### _ready()


### _process(_delta: float)

Mise à jour à chaque frame (callback Godot)
delta:float - Temps écoulé depuis la dernière frame en secondes


### move()

Déplace le joueur selon les touches directionnelles appuyées


### sprite_modification()

Change l'animation du sprite selon la direction du déplacement


### _on_talknode_body_entered(body: Node2D)

Détecte l'entrée d'un PNJ dans la zone d'interaction (callback Godot)
body:Node2D - Corps entrant dans la zone


### _on_talknode_body_exited(body: Node2D)

Détecte la sortie d'un PNJ de la zone d'interaction (callback Godot)
body:Node2D - Corps sortant de la zone


### _unhandled_input(_event: InputEvent)

Gère les entrées non traitées pour démarrer les dialogues (callback Godot)
event:InputEvent - Événement d'entrée reçu

