extends Node

const MARGIN_EDGE = 8

class_name AsteroidUtils

static func teleport(obj, rect): 
	if obj.global_position.x < 0:
		obj.global_position.x = rect.size.x - MARGIN_EDGE
	elif obj.global_position.x > rect.size.x + MARGIN_EDGE:
		obj.global_position.x = MARGIN_EDGE
	
	if obj.global_position.y < 0:
		obj.global_position.y = rect.size.y - MARGIN_EDGE
	elif obj.global_position.y > rect.size.y + MARGIN_EDGE:
		obj.global_position.y = MARGIN_EDGE