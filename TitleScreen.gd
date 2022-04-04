extends MarginContainer

signal max_time_changed(max_time)
signal min_time_changed(min_time)

func _ready():
    initialise_game_values()

func initialise_game_values():
    Story.initialise()

func _on_VolumeUp_pressed():
    Sound.play_button_jingle()
    Sound.master_volume_up()

func _on_VolumeDown_pressed():
    Sound.play_button_jingle()
    Sound.master_volume_down()

func _on_StartButton_pressed():
    Switcher.switch_scene("res://StoryScene.tscn")
    Sound.play_button_jingle()

func _on_TutorialButton_toggled(button_pressed):
    if button_pressed:
        Sound.play_button_jingle()
    else:
        Sound.play_cancel()
    Options.tutorial = button_pressed

func _on_GenderButton_toggled(button_pressed):
    if button_pressed:
        Sound.play_button_jingle()
    else:
        Sound.play_cancel()
    Options.trad = button_pressed

func _on_LimitButton_toggled(button_pressed):
    if button_pressed:
        Sound.play_button_jingle()
    else:
        Sound.play_cancel()

func _on_VolumeSpinBox_value_changed(value):
    Sound.set_master_volume(value - 10)

func _on_MaxSpinBox_value_changed(value):
    Options.max_time = value
    emit_signal("max_time_changed", value)

func _on_MinSpinBox_value_changed(value):
    Options.min_time = value
    emit_signal("min_time_changed", value)
