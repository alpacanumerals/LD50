extends MarginContainer

func _ready():
    $NightArea.initialise()

func _on_DoneButton_pressed():
    var subject = Story.current_tale[Story.phase.SUBJECT]
    var verb = Story.current_tale[Story.phase.VERB]
    var object = Story.current_tale[Story.phase.OBJECT]
    
    var failed = Story.tell_story(subject, verb, object)
    
    $NightArea.night_fall(failed)

func _on_TimeLimit_time_up():
    $NightArea.night_fall(true)
    
