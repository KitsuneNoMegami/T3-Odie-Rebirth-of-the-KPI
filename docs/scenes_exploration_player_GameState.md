# GameState.gd

**Path:** `audit--rebirth-of-the-kpi/scenes/exploration/player/GameState.gd`

**Extends:** `Node`

## Variables

### pause

État de pause du jeu

```gdscript
var pause = false
```

### fight_scene

Référence à la scène de combat

```gdscript
var fight_scene
```

### _pole

Pôle actuellement en combat

```gdscript
var _pole
```

### tuto_watched

Tuto vu ?

```gdscript
var tuto_watched=false;
```

### commercial_win

Indique si le pôle Commercial a été vaincu

```gdscript
var commercial_win = null;
```

### rh_win

Indique si le pôle RH a été vaincu

```gdscript
var rh_win = null;
```

### informatique_win

Indique si le pôle Informatique a été vaincu

```gdscript
var informatique_win = null;
```

### communcation_win

Indique si le pôle Communication a été vaincu

```gdscript
var communcation_win = null;
```

### finance_win

Indique si le pôle Finance a été vaincu

```gdscript
var finance_win = null;
```

## Functions

### get_tuto_state()


### watch_tuto()


### set_pause(value: bool)


### get_player()


### start_fight(path, pole)

Démarre un combat avec un pôle spécifique
path:String - Chemin vers le script des ennemis
pole:String - Nom du pôle à combattre


### set_fight(fight)

Définit la référence à la scène de combat
fight:CanvasLayer - Référence à la scène de combat


### get_pause()

Retourne l'état de pause actuel


### get_pole()

Retourne le pôle actuellement en combat


### get_win(pole)

Vérifie si un pôle a été vaincu
pole:String - Nom du pôle à vérifier
Retourne:bool - true si le pôle a été vaincu


### change_state_pole(pole,state)

Marque un pôle comme vaincu
pole:String - Nom du pôle à marquer comme vaincu

