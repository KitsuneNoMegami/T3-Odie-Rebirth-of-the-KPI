# message_panel.gd

**Path:** `audit--rebirth-of-the-kpi/scenes/fight/message_panel.gd`

**Extends:** `Panel`

## Functions

### show_message_blocking(text: String)

Affiche un message et attend que le joueur appuie sur "accept"
text:String - Texte du message à afficher


### change_size(_size,x,y)


### show_message_nonblocking(text: String)

Affiche un message sans bloquer le jeu
text:String - Texte du message à afficher


### show_description(text: String)

Affiche une description (alias de show_message_nonblocking)
text:String - Texte de la description


### hide_description()

Cache le panneau de description


### show_message(text: String)

Méthode de compatibilité pour show_message (redirige vers bloquant)
text:String - Texte du message


### close_message()

Ferme le message


### get_visible()

Retourne l'état de visibilité du panneau

