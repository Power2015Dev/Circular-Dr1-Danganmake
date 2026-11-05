@tool
extends Node2D

# Anillo rojo de la intro, se anima desde el AnimationPlayer

const CENTRO := Vector2(960, 800)
const RADIO := 1014.0
const GROSOR := 126.0
const COLOR := Color(0.85, 0.17, 0.03, 0.6)

# Progreso de cada barrido (0 a 1)
@export_range(0.0, 1.0) var progreso_izq : float = 0.0:
	set(v):
		progreso_izq = v
		queue_redraw()
@export_range(0.0, 1.0) var progreso_der : float = 0.0:
	set(v):
		progreso_der = v
		queue_redraw()

# Dibuja los pedazos del anillo que van creciendo hacia arriba
func _draw() -> void:
	var izq := deg_to_rad(-165.0)
	var der := deg_to_rad(-15.0)
	var arriba := deg_to_rad(-90.0)
	if progreso_izq > 0.0:
		draw_arc(CENTRO, RADIO, izq, lerpf(izq, arriba, progreso_izq), 48, COLOR, GROSOR, true)
	if progreso_der > 0.0:
		draw_arc(CENTRO, RADIO, der, lerpf(der, arriba, progreso_der), 48, COLOR, GROSOR, true)
