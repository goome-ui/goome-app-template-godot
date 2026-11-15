extends Node

var ui: GoomeView


func _ready() -> void:
	get_tree().create_timer(60.0).timeout.connect(func() -> void:
		print("check timed out")
		get_tree().quit(2))
	get_window().size = Vector2i(640, 420)
	var main: Node = load("res://main.tscn").instantiate()
	add_child(main)
	ui = main.get_node("UI/View")
	run.call_deferred()


func frames(n: int) -> void:
	for i in n:
		await get_tree().process_frame


func click(p: Vector2) -> void:
	for down in [true, false]:
		var e := InputEventMouseButton.new()
		e.button_index = MOUSE_BUTTON_LEFT
		e.pressed = down
		e.position = p
		e.global_position = p
		Input.parse_input_event(e)
		await frames(2)


func run() -> void:
	await frames(10)
	var m := InputEventMouseMotion.new()
	m.position = Vector2(60, 28)
	m.global_position = m.position
	Input.parse_input_event(m)
	await frames(2)
	await click(Vector2(60, 28))
	await frames(5)
	var ok: bool = ui.get("overlay")
	print("check ", "passed" if ok else "FAILED")
	get_tree().quit(0 if ok else 1)
