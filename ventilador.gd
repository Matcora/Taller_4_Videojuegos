class_name Ventilador
extends ElementoPlayground
## Empuja con una fuerza constante hacia su "arriba" local (gírenlo para soplar de lado).

@export var fuerza := 19.6   # N: el doble del peso de una pelota de 1 kg


func actuar(cuerpo: RigidBody3D, _delta: float) -> void:
	cuerpo.apply_central_force(global_transform.basis.y.normalized() * fuerza)
