extends Button

func _ready():
    pass

func _process(_delta):
    if (Story.current_phase == Story.phase.NONE):
        set_mouse_filter(Control.MOUSE_FILTER_STOP)
    else:
        set_mouse_filter(Control.MOUSE_FILTER_IGNORE)
