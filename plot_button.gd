extends Button

export(int) var subject_id
export(int) var verb_id
export(int) var object_id

func _ready():
    pass

func _on_Button_pressed():
    Story.tell_story(subject_id, verb_id, object_id)
