# creation_fighter.gd

**Path:** `audit--rebirth-of-the-kpi/scenes/fight/scripts/creation_fighter.gd`

**Extends:** `Node`

## Constants

### FighterScene = preload("res://scenes/fight/scripts/ennemies/Fighter.tscn")


## Variables

### fighter

```gdscript
var fighter = FighterScene.instantiate()
```

### buff

```gdscript
var buff=1+(((pole_skill-player_skill)+(pole_credibility-player_credibility))/100)
```

### attacks

```gdscript
var attacks
```

### Fighters

```gdscript
var Fighters=[]
```

### fighter1

```gdscript
var fighter1
```

### fighter2

```gdscript
var fighter2
```

### fighter3

```gdscript
var fighter3
```

### buff

```gdscript
var buff
```

## Functions

### _ready()

Initialisation (callback Godot)


### create_fighter(pv: int, fname: String, attacks: Array, defenses: Array = [],description:String="")

Crée et retourne un groupe d'ennemis pour un pôle donné
pole:String - Nom du pôle ("rh", "it", etc.)
Retourne:Array - Liste de 3 combattants ennemis


### generate_buff(pole_skill,pole_credibility,player_skill,player_credibility)


### get_fighters(pole,lvl_skill,lvl_credibility)

