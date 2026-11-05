class_name Iman
extends ElementoPlayground
## Atrae hacia su centro con una fuerza que cae con el cuadrado de la distancia.

@export var k := 20.0             # N·m²
@export var distancia_minima := 0.5


func actuar(cuerpo: RigidBody3D, _delta: float) -> void:
	var hacia := global_position - cuerpo.global_position
	var d := maxf(Vectores.longitud(hacia), distancia_minima)
	cuerpo.apply_central_force(Vectores.normalizar(hacia) * fuerza_a(d, k))


## Función pura: F = k / d². La distancia mínima evita dividir por casi cero.
static func fuerza_a(d: float, k_: float) -> float:
	return k_ / (d * d)
