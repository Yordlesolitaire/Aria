extends Aria


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var Lanterne = $Lanterne
@onready var Detection = $Detection
@onready var Limite_hit = $Limite/CollisionShape2D
@export var follow_speed := 8.0
@export var idle_speed := 30.0
@export var idle_change_time := 10.0

var random_idle_pos := Vector2.ZERO
var idle_timer := 0.0
var DELTA = null

func _physics_process(delta: float) -> void:
	DELTA = delta
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	Zone(delta)
	move()
	move_and_slide()



func Zone(delta):
	if follow_enemy(delta):
		return

	idle_lantern(delta)



func follow_enemy(delta) -> bool:
	for elt in Detection.get_overlapping_bodies():
		if elt.is_in_group("ennemi"):
			var angle = (elt.global_position - Detection.global_position).angle()
			var target_pos = Vector2(cos(angle), sin(angle)) * (Limite_hit.shape.radius * 0.8)

			Lanterne.position = Lanterne.position.lerp(
				target_pos,
				delta * follow_speed
			)

			# Rotation optionnelle
			# Lanterne.rotation = lerp_angle(Lanterne.rotation, angle, delta * follow_speed)

			return true # ennemi trouvé

	return false # aucun ennemi


func idle_lantern(delta):
	idle_timer -= delta
	if idle_timer <= 0.0:
		idle_timer = idle_change_time
		var a = randf() * TAU
		var radius_min = $Min/CollisionShape2D.shape.radius
		var radius_max = $Limite/CollisionShape2D.shape.radius
		var radius = randf_range(radius_min, radius_max)
		random_idle_pos = Vector2(cos(a), sin(a)) * radius
	Lanterne.rotation = lerp_angle(Lanterne.rotation,0.0,delta * follow_speed)
	L_move_r(random_idle_pos,idle_speed*delta)
	
	
	
func L_move_r(random_idle_pos,idle_speed):
	Lanterne.position = Lanterne.position.move_toward(random_idle_pos,idle_speed)
func move():
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity.x = direction.x * SPEED


func _on_lanterne_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Aria"):
		var a = randf() * TAU
		var radius_min = $Min/CollisionShape2D.shape.radius
		var radius_max = $Limite/CollisionShape2D.shape.radius
		var radius = randf_range(radius_min, radius_max)
		random_idle_pos = Vector2(cos(a), sin(a)) * radius
		L_move_r(random_idle_pos,idle_speed*DELTA)
