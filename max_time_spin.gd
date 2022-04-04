extends SpinBox

func _on_TitleScreen_min_time_changed(min_time):
    if min_time > value:
        value = min_time
