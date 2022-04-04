extends SpinBox

func _on_TitleScreen_max_time_changed(max_time):
    if max_time < value:
        value = max_time
