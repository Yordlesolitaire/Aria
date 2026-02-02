extends Node2D

@onready var player:ShaderMaterial = $Aria/AnimatedSprite2D.material

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Pause.player = player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
