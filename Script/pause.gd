extends CanvasLayer
@onready var Menu = $Control
var player:ShaderMaterial
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Menu.hide()
	


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		pause_unpause()

func _process(delta: float) -> void:
	Menu.visible = get_tree().paused

func pause_unpause():
	get_tree().paused = !get_tree().paused


func _on_reprendre_pressed() -> void:
	pause_unpause()
