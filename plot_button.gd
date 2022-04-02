extends Button

func _ready():
    pass

func _on_DoneButton_pressed():
    var subject = Story.current_tale[Story.phase.SUBJECT]
    var verb = Story.current_tale[Story.phase.VERB]
    var object = Story.current_tale[Story.phase.OBJECT]
    Story.tell_story(subject, verb, object)

func _process(_delta):
    if (Story.current_phase == Story.phase.NONE):
        set_mouse_filter(Control.MOUSE_FILTER_STOP)
    else:
        set_mouse_filter(Control.MOUSE_FILTER_IGNORE)
