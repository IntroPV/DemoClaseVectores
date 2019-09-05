extends Node

##############################################################################################################
# Game Loop
#    - 30fps vs 60fps o más. 0.0166s (16ms) para procesar todo.
#    - delta
#    - Godot trata de ejecutar cada intervalos iguales en _physics_process y tan rápido como pueda en _process
#
##############################################################################################################

onready var demo = $demo
onready var fps = $gui/fps
onready var red_label = $demo/red/label
onready var green_label = $demo/green/label


func _ready():
	demo.reset_square_positions()

func _process(delta):
	fps.text = "FPS: %d" % Engine.get_frames_per_second()
	red_label.text = str(stepify(demo.red.position.y, 0.1))

func _physics_process(delta):
	green_label.text = str(stepify(demo.green.position.y, 0.1))

func _on_reset_pressed():
	demo.reset_square_positions()

func _on_changeStep_pressed():
	demo.step = $gui/step.text.to_float()

func _on_useDelta_toggled(button_pressed):
	demo.useDelta = button_pressed
