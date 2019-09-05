extends Node2D

onready var dir = $Direction
export(int) var vision_range = 200
export(float) var speed = 50
export(float) var friction = 0.9

var has_detected = false
var target:Vector2
var velocity := Vector2.ZERO

func _ready():
	pass

func _process(delta):
	_update_position(get_local_mouse_position())

func _physics_process(delta):
	
	if has_detected:
		velocity += target.normalized() * speed
		
	velocity *= friction
	if velocity.length() < 1:
		velocity = Vector2.ZERO
	
	position += velocity * delta


func _update_position(mouse_pos:Vector2):
	
	if mouse_pos.length() <= vision_range:
		target = mouse_pos
		has_detected = true
		dir.vector = mouse_pos
	else:
		dir.vector = Vector2.ZERO
		has_detected = false	
	
func _draw():
	draw_circle(Vector2.ZERO, vision_range, Color(1,1,1,0.1))