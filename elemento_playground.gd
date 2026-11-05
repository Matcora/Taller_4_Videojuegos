class_name ElementoPlayground
extends Area3D
## Solución del Taller 3. Clase base: un área que actúa sobre los cuerpos que tiene adentro.
## Las hijas solo dicen CÓMO actúan (redefinen actuar o al_entrar); el recorrido lo hace la base, una vez.


func _ready() -> void:
	collision_layer = 4    # capa 3: elementos
	collision_mask = 2     # capa 2: solo las pelotas
	body_entered.connect(_on_body_entered)


func _physics_process(delta: float) -> void:
	for cuerpo in get_overlapping_bodies():
		if cuerpo is RigidBody3D:
			actuar(cuerpo, delta)


func _on_body_entered(cuerpo: Node3D) -> void:
	if cuerpo is RigidBody3D:
		al_entrar(cuerpo)


## Cada frame, sobre cada cuerpo que está adentro. La base no hace nada.
func actuar(_cuerpo: RigidBody3D, _delta: float) -> void:
	pass


## Una vez, cuando el cuerpo entra. La base no hace nada.
func al_entrar(_cuerpo: RigidBody3D) -> void:
	pass
