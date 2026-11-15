extends GoomeView

var start := Time.get_ticks_msec()
var shown := true


func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_H and event.alt_pressed:
		shown = not shown


func _goome_frame(ui: GoomeUI) -> void:
	if not shown:
		return
	if ui.window("hud", Rect2(20, 20, 160, 0), GoomeUI.WIN_NO_TITLE):
		ui.heading(Time.get_time_string_from_system())
		ui.label("up %ds" % ((Time.get_ticks_msec() - start) / 1000))
		ui.label("%d fps" % Engine.get_frames_per_second())
	ui.window_end()
