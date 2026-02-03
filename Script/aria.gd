extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
const ACCEL = 2000.0
const FRICTION = 1800.0
var amplitude = 10.0      # hauteur verticale
var sway_amount = 5.0     # déplacement horizontal
var speed = 2.0           # vitesse
var pulse_amount = 0.3    # pulsation d'intensité
var base_energy = 1.0     # énergie de base

@onready var Zone = $Detection
@onready var lanterne:Lanterne = $Lanterne
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	zone(delta)
	simple_move(delta)
	lanterne.move_and_slide()
	move_and_slide()




func simple_move(delta:float) -> void:
		# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	if direction:
		velocity.x = move_toward(velocity.x, direction.x * SPEED, ACCEL * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
func zone(delta:float):
	for elt in Zone.get_overlapping_bodies():
		if elt.is_in_group("ennemi"):
			var dir = elt.global_position - Zone.global_position
			var angle = dir.angle() # radians
			lanterne.position = (Vector2(cos(angle), sin(angle)) * $Limit/CollisionShape2D.shape.radius)
			lanterne.rotation = angle
		else:
			lanterne.rotation_degrees = 0
