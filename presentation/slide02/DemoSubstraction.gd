extends Node2D


onready var red = $Red
onready var redVec = $RedPosition
onready var green = $Green
onready var greenVec = $GreenPosition
onready var diffVec = $DifferenceVector

var draggedObject = null

func update_vectors():
	redVec.vector = red.position
	greenVec.vector = green.position
	diffVec.position = greenVec.vector
	diffVec.vector = redVec.vector - greenVec.vector

func _process(delta):
	if draggedObject:
		_apply_drag(get_local_mouse_position())

func _input(event):
	if event is InputEventMouseButton:
		if not draggedObject and event.pressed:
			_check_drag(to_local(event.position))
		elif not event.pressed:
			draggedObject = null	
			
func _apply_drag(pos):
	draggedObject.position = pos
	update_vectors()

func _check_drag(cursor:Vector2):
	
	if Rect2(red.position - red.get_rect().size/2, red.get_rect().size).has_point(cursor):
		draggedObject = red
	elif Rect2(green.position - green.get_rect().size/2, green.get_rect().size).has_point(cursor):
		draggedObject = green
	else:
		draggedObject = null	