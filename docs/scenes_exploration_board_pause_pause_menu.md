# Pause_menu

**Path:** `audit--rebirth-of-the-kpi/scenes/exploration/board/pause/pause_menu.gd`

## Variables

### pause

État de pause

```gdscript
var pause=false
```

### text

Liste des labels du menu

```gdscript
var text: Array[Label]
```

### nb

Index de l'élément sélectionné (4 = aucune sélection)

```gdscript
var nb := 4
```

### current_db

```gdscript
var current_db := AudioServer.get_bus_volume_db(0)
```

## Functions

### _ready()

Initialisation du menu de pause (callback Godot)


### _setup_volume_bar()

Configure la barre de volume


### _on_volume_changed(value: float)

Callback du changement de volume
value:float - Nouvelle valeur linéaire du volume (0-1)


### pause_unpause()

Bascule entre pause et reprise du jeu


### _on_continue_pressed()

