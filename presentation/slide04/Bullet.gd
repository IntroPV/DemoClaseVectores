extends Node2D

const SPEED = 400
var velocity = Vector2.ZERO

func fly(dir:Vector2):
	velocity = dir.normalized() * SPEED 
	
func _physics_process(delta):
	position += velocity * delta

func remove():
	get_parent().remove_child(self)
	queue_free()
