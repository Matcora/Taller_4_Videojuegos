class_name LuzJugador
extends OmniLight3D

@export var rango := 2.0 # m: hasta dónde alumbra (audífonos del protagonista en VOIDHEART: 2 m)
@export var altura := 1.2 # m sobre los pies del jugador


func _ready() -> void:
	position = Vector3(0.0, altura, 0.0)
	omni_range = rango
	omni_attenuation = 2.0 # atenuación que se parece a 1/d²

	# Prueba de la función pura requerida por la guía:
	print("LuzJugador atenuacion: ", atenuacion(1.0), " ", atenuacion(2.0), " ", atenuacion(4.0))


static func atenuacion(d: float, exponente: float = 2.0) -> float:
	return 1.0 / pow(maxf(d, 0.0001), exponente)
