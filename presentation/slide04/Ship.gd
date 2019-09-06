extends Sprite

const PROPULSION_SPEED = 200
const ROTATION_SPEED = 2
const FRICTION = 0.1

onready var bullet_template = preload("res://presentation/slide04/Bullet.tscn")

var direction := Vector2(0, -1)
var rotation_velocity : float = 0
var propulsion : float = 0
var velocity = Vector2.ZERO

func _physics_process(delta):
	rotation_velocity = min(ROTATION_SPEED, abs(rotation_velocity)) * sign(rotation_velocity)
	
	velocity += direction.rotated(rotation) * propulsion * delta
	
	position += velocity * delta
	rotate(rotation_velocity * delta)

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotation_velocity += ROTATION_SPEED * delta
		
	if Input.is_action_pressed("ui_left"):
		rotation_velocity -= ROTATION_SPEED * delta
		
	if Input.is_action_pressed("ui_up"):
		propulsion = PROPULSION_SPEED
	else:
		propulsion = 0	
	
	if Input.is_action_just_pressed("ui_select"):
		fire()
	
	utils.teleport(self, get_viewport_rect())
	
func fire():
	var bullet:Node2D = bullet_template.instance()
	bullet.global_position = $Position2D.global_position
	bullet.fly(direction.rotated(rotation))
	get_parent().add_child(bullet)