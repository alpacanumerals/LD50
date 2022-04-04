extends MarginContainer

signal go_back(phase)

func _ready():
    $NightArea.initialise()
    set_start_sprites()

func _on_DoneButton_pressed():
    var subject = Story.current_tale[Story.phase.SUBJECT]
    var verb = Story.current_tale[Story.phase.VERB]
    var object = Story.current_tale[Story.phase.OBJECT]
    
    $Tutorial.night = true
    
    var failed = Story.tell_story(subject, verb, object)
    
    $NightArea.night_fall(failed)

func _on_TimeLimit_time_up():
    $NightArea.night_fall(true)

func _on_NightArea_game_over():
    set_end_sprites()

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

func go_back():
    if (Story.current_phase != Story.phase.SUBJECT):
        Sound.play_cancel()
        emit_signal("go_back", Story.current_phase)
        Story.remove_word()

func _input(event):
    if event.is_action_pressed("right_click"):
        go_back()
        get_tree().set_input_as_handled()
