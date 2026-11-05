class_name Generador
extends Node3D
## Crea una pelota cada "intervalo" segundos; si hay más de "maximo", borra la más vieja.

@export var pelota: PackedScene
@export var intervalo := 1.5
@export var maximo := 10

var creadas: Array[Node3D] = []
var reloj := 0.0


func _physics_process(delta: float) -> void:
	reloj += delta
	if reloj >= intervalo:
		reloj -= intervalo
		crear()


func crear() -> void:
	var p := pelota.instantiate() as Node3D
	get_parent().add_child(p)
	p.global_position = global_position + Vector3(randf_range(-0.2, 0.2), 0, randf_range(-0.2, 0.2))
	creadas.append(p)
	while creadas.size() > maximo:
		var vieja = creadas.pop_front()
		if is_instance_valid(vieja):
			vieja.queue_free()
