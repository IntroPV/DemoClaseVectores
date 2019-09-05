extends Node2D

const ARROW_LENGTH = 20

onready var coordinate = $Coordinate
onready var cursor_vec = $VisualVector

var mouse_position = Vector2(0,0)

func _ready():
	coordinate.add_color_override("font_color", cursor_vec.tint)

# Es llamado ante eventos de user input.
func _input(event):
	if event is InputEventMouseMotion and event.position != mouse_position:
		var global_mouse_pos = Vector2(min(event.position.x, get_viewport().get_visible_rect().size.x/2 - 128), event.position.y)
		
		# La posición del mouse está dada en coordenadas globales,
		# necesitamos convertirlas a coordenadas locales al nodo sobre el que estamos trabajando.
		update_cordinate(to_local(global_mouse_pos))

func update_cordinate(mouse_position):
	coordinate.rect_position = mouse_position - Vector2(0, 24)
	coordinate.text = str(vec_stepify(mouse_position, 1))
	
	$Magnitude.text = "Magnitud (módulo): %d" % cursor_vec.vector.length()
	$Direction.text = "Dirección (unitario): %s" % str(vec_stepify(cursor_vec.vector.normalized(), 0.001))
	
	cursor_vec.set_vector(mouse_position)
	
func vec_stepify(vec:Vector2, dec:float) -> Vector2:
	return Vector2(stepify(vec.x, dec), stepify(vec.y, dec))