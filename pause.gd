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


func _on_cheveux_color_changed(color: Color) -> void:
	#(0.243, 0.208, 0.275,1)
	#(0.18, 0.133, 0.184,1)
	#(0.384, 0.333, 0.396,1)
	player.set_shader_parameter("replace_Hair1",Color(color))
	player.set_shader_parameter("replace_Hair2",Color(color[0] - 0.063,color[1] - 0.075,color[2] - 0.091,1))
	player.set_shader_parameter("replace_Hair3",Color(color[0] + 0.141,color[1] + 0.125,color[2] + 0.121,1))

func _on_eyes_color_changed(color: Color) -> void:
	print(color)
	player.set_shader_parameter("replace_eyes",Color(color))

func _on_bijoux_color_changed(color: Color) -> void:
	print(Color(color))
	#(0.9765, 0.7608, 0.1686, 1.0)
	#(0.9686, 0.5882, 0.0902, 1.0)
	#(0.8039, 0.4078, 0.2392, 1.0)

	player.set_shader_parameter("replace_Bijoux1",color)
