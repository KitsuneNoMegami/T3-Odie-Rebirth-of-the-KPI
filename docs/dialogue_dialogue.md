# dialogue.gd

**Path:** `audit--rebirth-of-the-kpi/dialogue/dialogue.gd`

**Extends:** `CanvasLayer`

## Variables

### next_action

The action to use for advancing the dialogue

```gdscript
@export var next_action: StringName = &"ui_accept"
```

### skip_action

The action to use to skip typing the dialogue

```gdscript
@export var skip_action: StringName = &"ui_cancel"
```

### resource

The dialogue resource

```gdscript
var resource: DialogueResource
```

### temporary_game_states

Temporary game states

```gdscript
var temporary_game_states: Array = []
```

### is_waiting_for_input

See if we are waiting for the player

```gdscript
var is_waiting_for_input: bool = false
```

### will_hide_balloon

See if we are running a long mutation and should hide the balloon

```gdscript
var will_hide_balloon: bool = false
```

### locals

A dictionary to store any ephemeral variables

```gdscript
var locals: Dictionary = {}
```

### _locale

```gdscript
var _locale: String = TranslationServer.get_locale()
```

### dialogue_line

The current line

```gdscript
var dialogue_line: DialogueLine:
```

### mutation_cooldown

A cooldown timer for delaying the balloon hide when encountering a mutation.

```gdscript
var mutation_cooldown: Timer = Timer.new()
```

### visible_ratio

```gdscript
var visible_ratio = dialogue_label.visible_ratio
```

### time

```gdscript
var time = dialogue_line.text.length() * 0.02 if dialogue_line.time == "auto" else dialogue_line.time.to_float()
```

### mouse_was_clicked

```gdscript
var mouse_was_clicked: bool = event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed()
```

### skip_button_was_pressed

```gdscript
var skip_button_was_pressed: bool = event.is_action_pressed(skip_action)
```

## Functions

### _ready()


### _unhandled_input(_event: InputEvent)


### _notification(what: int)


### start(dialogue_resource: DialogueResource, title: String, extra_game_states: Array = [])

Start some dialogue


### apply_dialogue_line()

Apply any changes to the balloon given a new [DialogueLine].


### next(next_id: String)

Go to the next line


### _on_mutation_cooldown_timeout()


### _on_mutated(_mutation: Dictionary)


### _on_balloon_gui_input(event: InputEvent)


### _on_responses_menu_response_selected(response: DialogueResponse)

