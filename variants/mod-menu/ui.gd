extends GoomeView

const APP_NAME := "My Goome App"

@onready var game: Node2D = get_node("../..")

var menu := false
var fly := false
var god := false
var speed := 1.0


func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_M and event.alt_pressed:
		menu = not menu


func _goome_frame(ui: GoomeUI) -> void:
	if not menu:
		if ui.window("hint", Rect2(20, 20, 190, 0), GoomeUI.WIN_NO_TITLE):
			ui.label("alt+m opens the menu")
		ui.window_end()
		return
	if ui.window(APP_NAME, Rect2(80, 80, 300, 0), GoomeUI.WIN_MOVE):
		fly = ui.toggle("Fly", fly)
		god = ui.checkbox("God mode", god)
		speed = ui.slider("Speed", speed, 1.0, 10.0, "%.1f")
		game.spin = speed
		if ui.button("Respawn"):
			ui.toast("respawned", 2000)
	ui.window_end()
