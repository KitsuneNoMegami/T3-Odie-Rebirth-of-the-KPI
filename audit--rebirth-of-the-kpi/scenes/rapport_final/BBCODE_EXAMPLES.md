# Guide BBCode pour DialogueLabel/RichTextLabel dans Godot

Les DialogueLabel utilisent BBCode (pas Markdown) pour le formatage du texte.

## Tags BBCode disponibles

### Formatage de texte de base
- `[b]texte en gras[/b]` - Texte en **gras**
- `[i]texte en italique[/i]` - Texte en *italique*
- `[u]texte souligné[/u]` - Texte souligné
- `[s]texte barré[/s]` - Texte ~~barré~~

### Couleurs
- `[color=red]texte rouge[/color]` - Texte en couleur
- `[color=#FF0000]texte rouge[/color]` - Couleur par code hexadécimal
- `[color=green]texte vert[/color]`
- Couleurs disponibles: red, green, blue, yellow, orange, purple, pink, cyan, white, black, gray

### Taille du texte
- `[font_size=20]texte plus grand[/font_size]`
- `[font_size=10]texte plus petit[/font_size]`

### Centrage et alignement
- `[center]texte centré[/center]`
- `[right]texte à droite[/right]`
- `[left]texte à gauche[/left]`

### Autres
- `[code]code monospace[/code]` - Texte en police monospace

## Exemple d'utilisation dans rapport_audit.gd

```gdscript
# Avant (texte plain)
comm.text = "COMMUNICATION\nObservations :\nNiveau de risque : très faible."

# Après (avec BBCode)
comm.text = "[b]COMMUNICATION[/b]\n[i]Observations :[/i]\n[color=green]Niveau de risque : très faible.[/color]"
```

## Exemple complet pour un rapport

```gdscript
comm.text = "[b]COMMUNICATION[/b]
Le Pôle Communication assure ses missions de manière satisfaisante.

[i]Observations :[/i]

• Les cahiers des charges sont parfois transmis après la date de livraison prévue.
• Les supports de communication sont clairs, complets et bien organisés.

[i]Points forts :[/i]

• Cohérence et clarté des messages.
• Organisation solide malgré des délais décalés.

[color=green]Niveau de risque : très faible.[/color]"
```

## Notes importantes

1. Les DialogueLabel ont déjà `bbcode_enabled = true`, donc le BBCode fonctionne automatiquement
2. Les retours à la ligne se font avec `\n` dans le code
3. N'oubliez pas de fermer tous les tags BBCode ouverts
4. Pour tester, vous pouvez modifier une seule section d'abord pour voir le résultat
