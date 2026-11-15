extends Node2D

var spin := 1.0
var angle := 0.0


func _process(delta: float) -> void:
	angle += spin * delta
	queue_redraw()


func _draw() -> void:
	var size := get_viewport_rect().size
	draw_rect(Rect2(Vector2.ZERO, size), Color("1b1d22"))
	draw_set_transform(size / 2, angle)
	draw_rect(Rect2(-60, -60, 120, 120), Color("6fdc5f"))
	draw_set_transform(Vector2.ZERO)
