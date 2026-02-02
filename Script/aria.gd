extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
const ACCEL = 2000.0
const FRICTION = 1800.0
@onready var Zone = $Detection
@onready var lanterne = $Lanterne

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	zone()
	simple_move(delta)
	move_and_slide()




func simple_move(delta:float) -> void:
		# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	if direction:
		velocity.x = move_toward(velocity.x, direction.x * SPEED, ACCEL * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
func zone():
	for elt in Zone.get_overlapping_bodies():
		if elt.is_in_group("ennemi"):
			var dir = elt.global_position - Zone.global_position
			var angle = dir.angle() # radians
			lanterne.position = Vector2(cos(angle), sin(angle)) * $Limit/CollisionShape2D.shape.radius
