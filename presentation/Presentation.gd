extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Game Loop
#    - 30fps vs 60fps o más. 0.0166s (16ms) para procesar todo.
#    - delta. Godot trata de ejecutar cada intervalos iguales en _physics_process y tan rápido como pueda en _process
#
# Motores de juegos como simulación.
#    - Renderización a intervalos discretos
#    - Física simplificada.
#    - Unidades arbitrarias. Metros? Pixels. Vamos a ver cámara y proyecciones más adelante.

# Vectores y puntos
#    - Qué es un vector. Magnitud y dirección.
#    - Operaciones vectoriales
#    - Vector unitario o normalizado.


# Coordenadas cartesianas y polares.
# Matrices de transformación
#    - Origen. Transform2D.
#    - Traslación, rotación, scale.
#    - Local position vs global position
#    - to_local() to_global()
#    - Chain transformations using multiplication

#- MRU.
#- Aceleración.
#- Detección y corrección de colisiones. Enfoque preventivo y correctivo. Bounding Boxes. Pixel Perfect.

