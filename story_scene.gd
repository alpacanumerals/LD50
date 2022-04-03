extends MarginContainer

func _ready():
    $NightArea.initialise()

func _on_DoneButton_pressed():
    var subject = Story.current_tale[Story.phase.SUBJECT]
    var verb = Story.current_tale[Story.phase.VERB]
    var object = Story.current_tale[Story.phase.OBJECT]
    
    #block interaction
    $NightArea.night_fall()
    
    Story.tell_story(subject, verb, object)
