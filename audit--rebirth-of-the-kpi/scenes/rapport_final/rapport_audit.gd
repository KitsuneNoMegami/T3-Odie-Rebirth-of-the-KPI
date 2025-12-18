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
		comm.text = "[b]COMMUNICATION[/b]\n" + "Le Pôle Communication assure ses missions de manière satisfaisante. Les flux d’information internes et externes sont structurés et cohérents. On note toutefois une tendance récurrente à l’humour verbal, avec des réponses réflexes “feur” à certains mots se terminant par “quoi”, ce qui n’impacte en rien la qualité des échanges.

[i]Observations :[/i]

	Les cahiers des charges sont parfois transmis après la date de livraison prévue, mais les équipes partenaires s’adaptent efficacement.

	Les supports de communication sont clairs, complets et bien organisés.

	Les messages internes restent compréhensibles malgré les petites particularités humoristiques.

[i]Points forts :[/i]

	Cohérence et clarté des messages.

	Organisation solide malgré des délais décalés.

	Supports professionnels et structurés.

[color=green]Niveau de risque : très faible.[/color]\n\n\n"
	else :
		comm.text="[b]COMMUNICATION[/b]\nAlors euh… le Pôle Communication, donc… ils communiquent. Je crois. Enfin, parfois. Il y a beaucoup de messages, beaucoup de mails, certains commencent par “quoi” et là… réflexe, FEUR. Oui FEUR. Désolé, mauvais réflexe de ma part.

[i]Observations :[/i]

	Les cahiers des charges arrivent, je pense, après la date prévue. Mais parfois avant ? Je ne sais plus trop. Dans mon agenda, il y a écrit “livrer quand ?” et un petit dessin d’un chat.

	Les supports de communication semblent… structurés ? Je me suis un peu perdu entre les PDF et les documents Word… ou était-ce Excel ?

	Messages internes : parfois clairs, parfois comme si quelqu’un avait mis un post-it dessus avec écrit “lol” en gros.

[i]Points forts :[/i]

	Hum… ils arrivent à se comprendre entre eux malgré mes difficultés à lire les documents.

	Organisation… euh… présente ?

	Supports professionnels… ou pas, mais c’est marrant.

[i]Commentaires personnels :[/i]

	Note à moi-même : arrêter de dire “feur” dans le rapport.

	Pourquoi je n’ai pas pris de café avant de commencer ?

[color=red]Niveau de risque : rapport inutilisable.[/color]\n\n\n"
	if (GameState.get_win("marketing")):
		market.text="[b]MARKETING[/b]\nLe Pôle Marketing montre une organisation solide et des campagnes bien ciblées. L’usage créatif de supports inhabituels, tels que des canards en plastique pour illustrer les segments d’audience, est cohérent et reflète une approche originale.

[i]Observations :[/i]

	Actions marketing cohérentes et alignées avec les objectifs.

	Les canards servent de support visuel efficace pour la segmentation.

	Bonne créativité maîtrisée et structurée.

[i]Points forts :[/i]

	Cohérence stratégique malgré l’originalité des supports.

	Supports visuels ludiques mais fonctionnels.

	Bonne combinaison de créativité et d’efficacité.

[color=green]Risques résiduels : mineurs.[/color]\n\n\n"
	else :
		market.text="[b]MARKETING[/b]\nLe Pôle Marketing, donc, ils font des campagnes, je crois. Mais là… y a plein de canards partout. Sérieusement. Des canards en plastique, sur le bureau, sur l’écran… Coincoin.

[i]Observations :[/i]

	Les actions marketing sont présentes, je suppose. Je les ai vues entre deux piles de canards.

	Segmentations… euh… il y a des canards alignés par couleur. Ça aide ? Peut-être. Moi je ne comprends pas trop.

	Créativité : on sent qu’ils ont beaucoup d’imagination, surtout pour dessiner des canards et les colorier selon les audiences.

[i]Points forts :[/i]

	Coincoin.

	Les canards semblent heureux.

	Il y a un coin “marketing” qui est très très coincoin.

[i]Commentaires personnels :[/i]

	Pourquoi mon stylo disparaît toujours dans ce bureau ?

	Dessin du canard fait par moi-même dans le rapport pour illustrer la confusion générale.

[color=red]Niveau de risque : rapport incohérent.[/color]\n\n\n"
		
	if (GameState.get_win("finance")):
		finance.text="[b]FINANCE[/b]\nLe Pôle Financier fonctionne correctement. Les bilans mensuels sont précis et illustrés de manière originale par de petits dessins, ce qui aide à repérer les catégories sans nuire à la rigueur comptable.

[i]Observations :[/i]

	Suivi rigoureux des comptes.

	Bilans clairs et fiables.

	Organisation efficace et structurée, avec une touche personnelle sympathique.

[i]Points forts :[/i]

	Suivi méthodique et précis des finances.

	Bilans justes malgré les illustrations.

	Organisation fonctionnelle et efficace.

[color=green]Niveau de risque : nul.[/color]\n\n\n"
	else : 
		finance.text="[b]FINANCE[/b]\nLe Pôle Financier fait des chiffres. Beaucoup de chiffres. Parfois avec du lait, parfois avec des croissants. Je ne sais pas pourquoi.

[i]Observations :[/i]

	Le bilan 2024 = lait demi-écrémé, 2x sucre, 1 croissant. Probablement correct ?

	Recettes – Dépenses = ??? → j’ai demandé au boulanger mais il était occupé.

	Tableau intitulé : “Budget (ou liste de courses ?)”. Oui, j’ai mis ça tel quel.

	Justificatifs : certains sont mangés (je rigole… peut-être pas).

[i]Points forts :[/i]

	Les chiffres sont là, quelque part.

	Organisation… assez structurée pour les amateurs de croissants.

[i]Commentaires personnels :[/i]

	Note : ne pas confondre les notes personnelles avec les bilans.

	Vérifier avec le chat si les post-it sont bien à leur place.

[color=red]Niveau de risque : rapport inutilisable.[/color]\n\n\n"
	if (GameState.get_win("informatique")):
		info.text="[b]INFORMATIQUE[/b]\nLe Pôle Informatique assure ses missions de manière efficace. Les présentations créatives (chant, danse) sont originales mais n’entravent pas la compréhension. Les procédures de sécurité sont fiables et bien documentées.

[i]Observations :[/i]

	Infrastructure stable et bien entretenue.

	Intervention rapide et efficace.

	Documentation claire, avec des ajouts humoristiques bienvenus (memes, illustrations).

[i]Points forts :[/i]

	Bonne organisation et rapidité d’intervention.

	Documentation complète et lisible.

	Sécurité et procédures fiables.

[color=green]Niveau de risque : faible.[/color]\n\n\n"
	else : 
		info.text="[b]INFORMATIQUE[/b]\nLe Pôle Informatique… wow… c’est compliqué. Il y a des serveurs qui chantent, des ordinateurs qui dansent… Je crois. Ou c’était moi qui dansais ?

[i]Observations :[/i]

	Il y a des lignes en binaire partout : 01000101 01101110 00100000 01110000 01100001 01101110 01101001 01100011… Je ne sais pas ce que ça veut dire, mais ça fait joli.

	Balises HTML mal fermées, comme : <serveur status=“ok”>Tout va bien</serveur (je crois que ça va bien).

	Les procédures de sécurité sont présentes mais je n’ai pas tout compris, peut-être parce que je chantais en même temps.

[i]Points forts :[/i]

	Infrastructure… euh, présente et vivante.

	Documentation pleine de memes motivants (moi je les trouve motivants).

[i]Commentaires personnels :[/i]

	ERR_402 : rapport terminé avec succès peut-être je sais pas.

	Note : acheter du café avant la prochaine session.

[color=orange]Niveau de risque : inconnu.[/color]\n\n\n"
	if (GameState.get_win("rh")):
		rh.text="[b]RESSOURCES HUMAINES[/b]\nLe Pôle RH est structuré et fonctionnel. La gestion des dossiers du personnel, des recrutements et des processus internes est cohérente et fiable.

[i]Observations :[/i]

	Processus RH documentés et suivis.

	Gestion des dossiers complète et précise.

	Communication interne claire et efficace.

[i]Points forts :[/i]

	Organisation solide et efficace.

	Suivi méthodique des procédures RH.

	Processus fiables et cohérents.

[color=green]Niveau de risque : faible.[/color]\n\n\n"
	else :
		rh.text="[b]RESSOURCES HUMAINES[/b]\nLe Pôle RH… alors là… euh… je ne sais pas trop par où commencer. Beaucoup de dossiers, de formulaires, et aussi des Post-it avec des smileys.

[i]Observations :[/i]

	Processus RH : je crois qu’ils sont là. Enfin, je les ai vus.

	Gestion des dossiers : ils existent, certains ont des taches de café dessus.

	Communication interne : parfois claire, parfois “à compléter plus tard ???”.

[i]Points forts :[/i]

	Organisation… il y a quelque chose, oui.

	Les smileys rendent l’atmosphère conviviale.

[i]Commentaires personnels :[/i]

	Note : acheter du café pour comprendre les formulaires.

	Ne pas oublier de sourire en relisant ce rapport.

[color=orange]Niveau de risque : rapport peu utile.[/color]\n\n\n"
	
	var credibility = GameState.get_player().get_credibility()

	if credibility >= 150:
		note.text = "[b][color=gold]NOTE DE L'AUDIT : S[/color][/b]"
	elif credibility >= 100:
		note.text = "[b][color=green]NOTE DE L'AUDIT : A[/color][/b]"
	elif credibility >= 50:
		note.text = "[b][color=yellow]NOTE DE L'AUDIT : B[/color][/b]"
	elif credibility >= 0:
		note.text = "[b][color=orange]NOTE DE L'AUDIT : C[/color][/b]"
	else:
		note.text = "[b][color=red]NOTE DE L'AUDIT : D[/color][/b]"
