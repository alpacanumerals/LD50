extends MarginContainer

func _ready():
    $NightArea.initialise()
    set_start_sprites()

func _on_DoneButton_pressed():
    var subject = Story.current_tale[Story.phase.SUBJECT]
    var verb = Story.current_tale[Story.phase.VERB]
    var object = Story.current_tale[Story.phase.OBJECT]
    
    var failed = Story.tell_story(subject, verb, object)
    
    $NightArea.night_fall(failed)

func _on_TimeLimit_time_up():
    $NightArea.night_fall(true)

func set_start_sprites():
    $Shez.visible = true
    $Sultan.visible = true
    $Shez2.visible = false
    $Sultan2.visible = false
    
func set_end_sprites():
    $Shez.visible = false
    $Sultan.visible = false
    $Shez2.visible = true
    $Sultan2.visible = true


func _on_NightArea_game_over():
    set_end_sprites()
