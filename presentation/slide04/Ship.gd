extends Sprite

const MARGIN_EDGE = 8
const PROPULSION_SPEED = 200
const ROTATION_SPEED = 2
const FRICTION = 0.1

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
		
	if global_position.x < 0:
		global_position.x = get_viewport_rect().size.x - MARGIN_EDGE
	elif global_position.x > get_viewport_rect().size.x + MARGIN_EDGE:
		global_position.x = MARGIN_EDGE
		
	if global_position.y < 0:
		global_position.y = get_viewport_rect().size.y - MARGIN_EDGE
	elif global_position.y > get_viewport_rect().size.y + MARGIN_EDGE:
		global_position.y = MARGIN_EDGE