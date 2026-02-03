extends PointLight2D

# Paramètres du flottement
var amplitude = 10.0      # hauteur verticale
var sway_amount = 5.0     # déplacement horizontal
var speed = 2.0           # vitesse
var pulse_amount = 0.3    # pulsation d'intensité
var base_energy = 1.0     # énergie de base

# Temps interne pour sin()
var t = 0.0

# Référence au sprite parent
@export var target_sprite: NodePath

func _process(delta):
	if not target_sprite:
		return

	t += delta

	var sprite_node = get_node(target_sprite)
	var base_pos = sprite_node.global_position

	# Oscillation verticale
	position.y = base_pos.y + sin(t * speed) * amplitude
	# Oscillation horizontale
	position.x = base_pos.x + sin(t * speed * 0.5) * sway_amount
	# Pulsation de l'énergie
	energy = base_energy + sin(t * speed * 1.5) * pulse_amount
