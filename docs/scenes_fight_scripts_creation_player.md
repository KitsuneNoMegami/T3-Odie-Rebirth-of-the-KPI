# creation_player.gd

**Path:** `audit--rebirth-of-the-kpi/scenes/fight/scripts/creation_player.gd`

**Extends:** `Node`

## Constants

### FighterScene = preload("res://scenes/fight/scripts/ennemies/Fighter.tscn")


## Variables

### attacks

```gdscript
var attacks=[Attack.new("Entretien")]
```

### defenses

```gdscript
var defenses=[Attack.new("Posture neutre")]
```

### player

```gdscript
var player = FighterScene.instantiate()
```

## Functions

### _ready()

Initialisation (callback Godot)


### get_player()

Crée et retourne une instance du joueur avec ses compétences
Retourne:Fighter - Instance du joueur de combat

