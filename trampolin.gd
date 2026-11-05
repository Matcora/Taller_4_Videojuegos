class_name Trampolin
extends ElementoPlayground
## Al entrar, el cuerpo sale hacia arriba con la rapidez justa para subir "altura" metros.

@export var altura := 3.0   # m


func al_entrar(cuerpo: RigidBody3D) -> void:
	var g: float = ProjectSettings.get_setting("physics/3d/default_gravity")
	cuerpo.apply_central_impulse(Vector3.UP * impulso_para_altura(cuerpo.mass, altura, g, cuerpo.linear_velocity.y))


## impulso = m·Δv, con la rapidez de subida v = √(2·g·h) (de v² = 2·g·h).
static func impulso_para_altura(masa: float, h: float, g: float, vy_actual: float) -> float:
	return masa * (sqrt(2.0 * g * h) - vy_actual)
