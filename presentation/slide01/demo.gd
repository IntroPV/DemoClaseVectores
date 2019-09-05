extends Node2D

const INITIAL_Y = 100

onready var fps = $gui/fps

onready var red = $red
onready var green = $green

var step := 0.5
var useDelta := false

func _ready():
	reset_square_positions()

func reset_square_positions():
	red.position.y = INITIAL_Y
	green.position.y = INITIAL_Y

func _process(delta):
	if useDelta:
		red.position.y += step * 60 * delta
	else:
		red.position.y += step

func _physics_process(delta):
	if useDelta:
		green.position.y += step * 60 * delta
	else:
		green.position.y += step	