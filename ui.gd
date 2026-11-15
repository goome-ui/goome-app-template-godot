extends GoomeView

const APP_NAME := "My Goome App"

@onready var game: Node2D = get_node("../..")

var clicks := 0
var overlay := false


func _goome_frame(ui: GoomeUI) -> void:
	var was := overlay
	if overlay:
		if ui.window(APP_NAME, Rect2(size.x - 340, 60, 300, 0), GoomeUI.WIN_MOVE | GoomeUI.WIN_COLLAPSE):
			contents(ui)
		ui.window_end()
	else:
		ui.app_begin(APP_NAME, 0)
		contents(ui)
		ui.app_end()
	if overlay != was:
		print("overlay mode" if overlay else "window mode")


func contents(ui: GoomeUI) -> void:
	overlay = ui.toggle("Overlay mode", overlay)
	ui.separator()
	ui.heading("Hello from " + APP_NAME)
	if ui.button("Click me"):
		clicks += 1
	ui.label("clicked %d times" % clicks)
	game.spin = ui.slider("Spin", game.spin, -6.0, 6.0, "%.1f")
