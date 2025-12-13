## Node/Script : Script de test pour un personnage platformer (non utilisé)
## Ce script semble être un template de base pour un personnage de plateforme
## mais n'est pas utilisé dans le jeu d'audit actuel
##
## Signaux : Aucun

extends CharacterBody2D


## Vitesse de déplacement horizontal en pixels/seconde
const SPEED = 300.0
## Vélocité du saut en pixels/seconde
const JUMP_VELOCITY = -400.0


## Traite la physique du personnage (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
