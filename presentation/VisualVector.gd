extends Node2D

class_name VisualVector

const ARROW_LENGTH = 20

# Se puede usar la palabra reservada export para visualizar
# y editar variables desde el inspector de nodo.
export(Color) var tint = Color.black
export(Vector2) var vector = Vector2.ZERO setget set_vector
export(int) var width = 4

func set_vector(v):
	vector = v
	update()

func _draw():
	draw_vector(Vector2.ZERO,vector,tint)

func draw_vector(origin:Vector2, vec:Vector2, color:Color):
	draw_line(
		origin, 
		vec.normalized() * (vec.length() - ARROW_LENGTH + 2), 
		color, 
		width)

	var points_arc = PoolVector2Array()
	var colors = PoolColorArray([color])
	
	var arrow_normal = -ARROW_LENGTH * vec.normalized()
	points_arc.push_back(vec)
	points_arc.push_back(vec - arrow_normal.rotated(2.8))
	points_arc.push_back(vec - arrow_normal.rotated(-2.8))
	
	draw_polygon(points_arc, colors)