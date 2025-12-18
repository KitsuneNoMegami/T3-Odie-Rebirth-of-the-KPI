# cursor.gd

**Path:** `audit--rebirth-of-the-kpi/scenes/fight/scripts/cursor.gd`

**Extends:** `AnimatedSprite2D`

## Variables

### _slot

Position actuelle du curseur (0-3)

```gdscript
var _slot = 0
```

### button1

Boutons des options de menu

```gdscript
@export var button1: Button
```

### button2

```gdscript
@export var button2: Button
```

### button3

```gdscript
@export var button3: Button
```

### button4

```gdscript
@export var button4: Button
```

### sound_handler

Gestionnaire des sons du menu

```gdscript
@export var sound_handler: AudioStreamPlayer
```

### _current_menu

Menu actuel affiché

```gdscript
var _current_menu = "main"
```

### _menu_options

Structure des menus disponibles (main, Attaque, Défense, Ennemis)

```gdscript
var _menu_options = [
```

### _selected_attack

Attaque sélectionnée par le joueur

```gdscript
var _selected_attack = null
```

### _selected_defense

Défense sélectionnée par le joueur

```gdscript
var _selected_defense = null
```

### _pending_action

Action en attente d'exécution ("Attaque" ou "Défense")

```gdscript
var _pending_action = "" # "Attaque" ou "Défense"
```

### _is_action_running

Empêche les actions multiples pendant l'exécution d'une action

```gdscript
var _is_action_running := false
```

### attacks

```gdscript
var attacks = []
```

### defenses

```gdscript
var defenses = []
```

### txt

```gdscript
var txt := ""
```

### label

```gdscript
var label = ["Attaque", "Défense", "Fuite"][min(_slot, 2)]
```

### aname

```gdscript
var aname = _menu_options[1][1 + _slot]
```

### atk

```gdscript
var atk = _resolve_attack_name_to_object(aname)
```

### aname

```gdscript
var aname = _menu_options[2][1 + _slot]
```

### def

```gdscript
var def = _resolve_defense_name_to_object(aname)
```

### aname

```gdscript
var aname = _menu_options[3][1 + _slot]
```

### enemy

```gdscript
var enemy = null
```

### i

```gdscript
var i = 0
```

### chosen

```gdscript
var chosen = _menu_options[0][slot] # 1=Attaque, 2=Défense
```

### chosen_attack_name

```gdscript
var chosen_attack_name = _menu_options[i][slot]
```

### chosen_defense_name

```gdscript
var chosen_defense_name = _menu_options[i][slot]
```

### enemy_name

```gdscript
var enemy_name = _menu_options[i][slot]
```

## Functions

### _ready()

Initialisation du curseur (callback Godot)


### _process(_delta: float)

Mise à jour de la position du curseur (callback Godot)
_delta:float - Temps écoulé depuis la dernière frame


### initialisation()

Réinitialise le curseur et affiche le menu principal


### actualize()

Met à jour les textes des boutons selon le menu actuel


### _show_attacks()

Affiche le menu des attaques disponibles


### _show_defenses()

Affiche le menu des défenses disponibles


### _show_ennemies()

Affiche la liste des ennemis ciblables


### _resolve_attack_name_to_object(aname)

Convertit un nom d'attaque en objet Attack
aname:String - Nom de l'attaque
Retourne:Attack - Objet attaque correspondant ou null


### _resolve_defense_name_to_object(dname)

Convertit un nom de défense en objet Attack
dname:String - Nom de la défense
Retourne:Attack - Objet défense correspondant ou null


### _update_description()

Met à jour le texte de description de l'option sélectionnée


### _input(event: InputEvent)

Gère les entrées clavier et souris (callback Godot)
event:InputEvent - Événement d'entrée


### _menu_input(slot)

Gère la navigation et les actions dans les menus
slot:int - Position du menu (1-4 pour les boutons, 5 pour retour au menu principal)


### _on_menu_option_1_mouse_entered()


### _on_menu_option_2_mouse_entered()


### _on_menu_option_3_mouse_entered()


### _on_menu_option_4_mouse_entered()


### _on_menu_option_1_pressed()


### _on_menu_option_2_pressed()


### _on_menu_option_3_pressed()


### _on_menu_option_4_pressed()

