# Sound_bar

**Path:** `audit--rebirth-of-the-kpi/scenes/exploration/board/pause/sound_bar.gd`

## Variables

### current_db

```gdscript
var current_db = AudioServer.get_bus_volume_db(0)
```

### db_value

```gdscript
var db_value = linear_to_db(new_value)
```

## Functions

### _ready()

Initialisation de la barre de volume (callback Godot)


### _on_value_changed(new_value: float)

Callback du changement de valeur de la barre
new_value:float - Nouvelle valeur (0-1)

