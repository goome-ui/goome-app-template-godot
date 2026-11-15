extends GoomeView

const APP_NAME := "My Goome App"

var clicks := 0
var shown := true


func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_H and event.alt_pressed:
		shown = not shown


func _goome_frame(ui: GoomeUI) -> void:
	if not shown:
		return
	if ui.window(APP_NAME, Rect2(60, 60, 280, 0), GoomeUI.WIN_MOVE):
		ui.label("im on top of the game")
		if ui.button("Click me"):
			clicks += 1
		ui.label("clicked %d times" % clicks)
		ui.label("alt+h hides me")
	ui.window_end()
