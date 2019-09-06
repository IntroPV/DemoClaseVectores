extends Sprite

onready var area = $Area2D

var velocity: Vector2

func _ready():
	velocity = Vector2.UP.rotated(randf() * 7)
	velocity *= randf() * 200

func _physics_process(delta):
	position += velocity * delta
	utils.teleport(self, get_viewport_rect())