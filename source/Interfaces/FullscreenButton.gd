extends CheckButton


func _ready() -> void:
	pressed = OS.window_fullscreen


func _toggled(button_pressed: bool) -> void:
	OS.window_fullscreen = button_pressed