extends CanvasLayer

@onready var comm = $ScrollContainer/VBoxContainer/communication
@onready var market = $ScrollContainer/VBoxContainer/marketing
@onready var finance = $ScrollContainer/VBoxContainer/finance
@onready var info = $ScrollContainer/VBoxContainer/informatique
@onready var rh = $ScrollContainer/VBoxContainer/rh
@onready var note=$ScrollContainer/VBoxContainer/note
var nb=0
func _ready():
	if (GameState.get_win("communication")):
		comm.text = "COMMUNICATION\n" + "Le Pôle Communication assure ses missions de manière satisfaisante. Les flux d’information internes et externes sont structurés et cohérents. On note toutefois une tendance récurrente à l’humour verbal, avec des réponses réflexes “feur” à certains mots se terminant par “quoi”, ce qui n’impacte en rien la qualité des échanges.

Observations :

Les cahiers des charges sont parfois transmis après la date de livraison prévue, mais les équipes partenaires s’adaptent efficacement.

Les supports de communication sont clairs, complets et bien organisés.

Les messages internes restent compréhensibles malgré les petites particularités humoristiques.

Points forts :

Cohérence et clarté des messages.

Organisation solide malgré des délais décalés.

Supports professionnels et structurés.

Niveau de risque : très faible.\n\n\n"
	else :
		comm.text="Alors euh… le Pôle Communication, donc… ils communiquent. Je crois. Enfin, parfois. Il y a beaucoup de messages, beaucoup de mails, certains commencent par “quoi” et là… réflexe, FEUR. Oui FEUR. Désolé, mauvais réflexe de ma part.

Observations :

Les cahiers des charges arrivent, je pense, après la date prévue. Mais parfois avant ? Je ne sais plus trop. Dans mon agenda, il y a écrit “livrer quand ?” et un petit dessin d’un chat.

Les supports de communication semblent… structurés ? Je me suis un peu perdu entre les PDF et les documents Word… ou était-ce Excel ?

Messages internes : parfois clairs, parfois comme si quelqu’un avait mis un post-it dessus avec écrit “lol” en gros.

Points forts :

Hum… ils arrivent à se comprendre entre eux malgré mes difficultés à lire les documents.

Organisation… euh… présente ?

Supports professionnels… ou pas, mais c’est marrant.

Commentaires personnels :

Note à moi-même : arrêter de dire “feur” dans le rapport.

Pourquoi je n’ai pas pris de café avant de commencer ?

Niveau de risque : rapport inutilisable.\n\n\n"
	if (GameState.get_win("marketing")):
		market.text="Le Pôle Marketing montre une organisation solide et des campagnes bien ciblées. L’usage créatif de supports inhabituels, tels que des canards en plastique pour illustrer les segments d’audience, est cohérent et reflète une approche originale.

Observations :

Actions marketing cohérentes et alignées avec les objectifs.

Les canards servent de support visuel efficace pour la segmentation.

Bonne créativité maîtrisée et structurée.

Points forts :

Cohérence stratégique malgré l’originalité des supports.

Supports visuels ludiques mais fonctionnels.

Bonne combinaison de créativité et d’efficacité.

Risques résiduels : mineurs.\n\n\n"
	else :
		market.text="Le Pôle Marketing, donc, ils font des campagnes, je crois. Mais là… y a plein de canards partout. Sérieusement. Des canards en plastique, sur le bureau, sur l’écran… Coincoin.

Observations :

Les actions marketing sont présentes, je suppose. Je les ai vues entre deux piles de canards.

Segmentations… euh… il y a des canards alignés par couleur. Ça aide ? Peut-être. Moi je ne comprends pas trop.

Créativité : on sent qu’ils ont beaucoup d’imagination, surtout pour dessiner des canards et les colorier selon les audiences.

Points forts :

Coincoin.

Les canards semblent heureux.

Il y a un coin “marketing” qui est très très coincoin.

Commentaires personnels :

Pourquoi mon stylo disparaît toujours dans ce bureau ?

Dessin du canard fait par moi-même dans le rapport pour illustrer la confusion générale.

Niveau de risque : rapport incohérent.\n\n\n"
		
	if (GameState.get_win("finance")):
		finance.text="Le Pôle Financier fonctionne correctement. Les bilans mensuels sont précis et illustrés de manière originale par de petits dessins, ce qui aide à repérer les catégories sans nuire à la rigueur comptable.

Observations :

Suivi rigoureux des comptes.

Bilans clairs et fiables.

Organisation efficace et structurée, avec une touche personnelle sympathique.

Points forts :

Suivi méthodique et précis des finances.

Bilans justes malgré les illustrations.

Organisation fonctionnelle et efficace.

Niveau de risque : nul.\n\n\n"
	else : 
		finance.text="Le Pôle Financier fait des chiffres. Beaucoup de chiffres. Parfois avec du lait, parfois avec des croissants. Je ne sais pas pourquoi.

Observations :

Le bilan 2024 = lait demi-écrémé, 2x sucre, 1 croissant. Probablement correct ?

Recettes – Dépenses = ??? → j’ai demandé au boulanger mais il était occupé.

Tableau intitulé : “Budget (ou liste de courses ?)”. Oui, j’ai mis ça tel quel.

Justificatifs : certains sont mangés (je rigole… peut-être pas).

Points forts :

Les chiffres sont là, quelque part.

Organisation… assez structurée pour les amateurs de croissants.

Commentaires personnels :

Note : ne pas confondre les notes personnelles avec les bilans.

Vérifier avec le chat si les post-it sont bien à leur place.

Niveau de risque : rapport inutilisable.\n\n\n"
	if (GameState.get_win("informatique")):
		info.text="Le Pôle Informatique assure ses missions de manière efficace. Les présentations créatives (chant, danse) sont originales mais n’entravent pas la compréhension. Les procédures de sécurité sont fiables et bien documentées.

Observations :

Infrastructure stable et bien entretenue.

Intervention rapide et efficace.

Documentation claire, avec des ajouts humoristiques bienvenus (memes, illustrations).

Points forts :

Bonne organisation et rapidité d’intervention.

Documentation complète et lisible.

Sécurité et procédures fiables.

Niveau de risque : faible.\n\n\n"
	else : 
		info.text="Le Pôle Informatique… wow… c’est compliqué. Il y a des serveurs qui chantent, des ordinateurs qui dansent… Je crois. Ou c’était moi qui dansais ?

Observations :

Il y a des lignes en binaire partout : 01000101 01101110 00100000 01110000 01100001 01101110 01101001 01100011… Je ne sais pas ce que ça veut dire, mais ça fait joli.

Balises HTML mal fermées, comme : <serveur status=“ok”>Tout va bien</serveur (je crois que ça va bien).

Les procédures de sécurité sont présentes mais je n’ai pas tout compris, peut-être parce que je chantais en même temps.

Points forts :

Infrastructure… euh, présente et vivante.

Documentation pleine de memes motivants (moi je les trouve motivants).

Commentaires personnels :

ERR_402 : rapport terminé avec succès peut-être je sais pas.

Note : acheter du café avant la prochaine session.

Niveau de risque : inconnu.\n\n\n"
	if (GameState.get_win("rh")):
		rh.text="Le Pôle RH est structuré et fonctionnel. La gestion des dossiers du personnel, des recrutements et des processus internes est cohérente et fiable.

Observations :

Processus RH documentés et suivis.

Gestion des dossiers complète et précise.

Communication interne claire et efficace.

Points forts :

Organisation solide et efficace.

Suivi méthodique des procédures RH.

Processus fiables et cohérents.

Niveau de risque : faible.\n\n\n"
	else :
		rh.text="Le Pôle RH… alors là… euh… je ne sais pas trop par où commencer. Beaucoup de dossiers, de formulaires, et aussi des Post-it avec des smileys.

Observations :

Processus RH : je crois qu’ils sont là. Enfin, je les ai vus.

Gestion des dossiers : ils existent, certains ont des taches de café dessus.

Communication interne : parfois claire, parfois “à compléter plus tard ???”.

Points forts :

Organisation… il y a quelque chose, oui.

Les smileys rendent l’atmosphère conviviale.

Commentaires personnels :

Note : acheter du café pour comprendre les formulaires.

Ne pas oublier de sourire en relisant ce rapport.

Niveau de risque : rapport peu utile.\n\n\n"
	
	match (GameState.get_player().get_credibility()):
		150:
			note.text="NOTE DE L'AUDIT  :  S"
		149:
			note.text="NOTE DE L'AUDIT  :  A"
		100:
			note.text="NOTE DE L'AUDIT  :  B"
		50:
			note.text="NOTE DE L'AUDIT  :  C"
		0:
			note.text="NOTE DE L'AUDIT  :  D"
		-50:
			note.text="NOTE DE L'AUDIT  :  D"
	note.text=note.text +"\n\n"
