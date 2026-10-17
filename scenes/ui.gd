extends CanvasLayer

@onready var pause_overlay: ColorRect = $PauseOverlay
@onready var resume_button: Button = $PauseOverlay/CenterContainer/VBoxContainer/Resume

func _ready() -> void:
	pause_overlay.hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_pause"):
		pause()

func pause() -> void:
	get_tree().paused = true
	pause_overlay.show()
	resume_button.grab_focus()

func unpause() -> void:
	get_tree().paused = false
	pause_overlay.hide()

func reload_level() -> void:
	get_tree().call_deferred("reload_current_scene")
	unpause()

func quit_game() -> void:
	get_tree().quit()
